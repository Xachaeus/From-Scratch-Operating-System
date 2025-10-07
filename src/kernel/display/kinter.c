#include <stdint.h>
#include <hardware-io/io.h>
#include <arch/x86/irq.h>
#include "VGA.h"
#include "kinter.h"

#define MIN(a,b) ((a < b) ? a : b)

// #define CURSOR_CHAR 0xDB
#define CURSOR_CHAR '<'
#define CURSOR_TIME_PERIOD 700000

uint16_t KI_VGACoordTransform(KI_Terminal* terminal, uint16_t x, uint16_t y) {
    x = x%terminal->inner_width;
    y = y%terminal->inner_height;
    uint16_t abs_x = terminal->tlx + x + 1;
    uint16_t abs_y = terminal->tly + y + 1;
    return (uint16_t)(abs_y * terminal->display->width + abs_x);
}


void KI_DrawCursor(KI_Terminal* terminal) {

    uint16_t offset = KI_VGACoordTransform(terminal, terminal->cursorx, terminal->cursory);
    // If within first half of second of cursor usage
    if (terminal->cursor_blinking_enabled) {
        if (terminal->cursor_timer < (CURSOR_TIME_PERIOD/2)) {
            ((uint8_t*)0xB8000)[offset*2] = terminal->cursor_char;
            ((uint8_t*)0xB8000)[offset*2+1] = terminal->color_data;
        }
        else {
            ((uint8_t*)0xB8000)[offset*2] = '\0';
            ((uint8_t*)0xB8000)[offset*2+1] = terminal->color_data;
        }
    }
    else {
        ((uint8_t*)0xB8000)[offset*2] = CURSOR_CHAR;
        ((uint8_t*)0xB8000)[offset*2+1] = terminal->color_data;
    }

}

void KI_CursorHook(KI_Terminal* terminal, uint32_t time_passed) {
    // Update the cursor timer; it only needs to show progress through a half second
    terminal->cursor_timer = (terminal->cursor_timer + time_passed) % CURSOR_TIME_PERIOD;
    KI_DrawCursor(terminal);
}

void KI_Initialize(KI_Terminal* terminal, VGA_Display* display, uint16_t tlx, uint16_t tly, uint16_t width, uint16_t height, uint8_t color_data, char* title) {
    if (width<5 || height<3){KI_BadSizeError(terminal);}

    terminal->display = display;
    terminal->width = width;
    terminal->height = height;
    terminal->inner_width = width-2;
    terminal->inner_height = height-2;
    terminal->tlx = tlx;
    terminal->tly = tly;

    terminal->cursorx = 0;
    terminal->cursory = 0;
    terminal->cursor_char = CURSOR_CHAR;
    terminal->cursor_timer = 0;
    terminal->cursor_blinking_enabled = 1;
    terminal->backspace_barrier = KI_VGACoordTransform(terminal, 0, 0);

    terminal->color_data = color_data;
    terminal->title = title;
    for (int i = 0; i < 256; i++) {
        terminal->input_buffer[i] = 0;
    }
    terminal->input_buffer_tail = 0;
    KI_Clear(terminal);
    KI_DrawBorder(terminal);
}

void KI_Clear(KI_Terminal* terminal) {
    for (int x = terminal->tlx; x < terminal->tlx + terminal->width; x++) {
        for (int y = terminal->tly; y < terminal->tly + terminal->height; y++) {
            VGA_SetChar(terminal->display, '\0', terminal->color_data, x, y);
        }
    }
}

void KI_DrawBorder(KI_Terminal* terminal) {
    uint16_t tlx = terminal->tlx;
    uint16_t tly = terminal->tly;
    uint16_t width = terminal->width;
    uint16_t height = terminal->height;
    uint8_t color_data = terminal->color_data;

    for (uint16_t x = tlx; x < tlx+width; x++){
        VGA_SetChar(terminal->display, VGA_HORIZONTAL_BAR_CHAR, color_data, x, tly);
        VGA_SetChar(terminal->display, VGA_HORIZONTAL_BAR_CHAR, color_data, x, tly+height-1);
    }

    for (uint16_t y = tly; y < tly+height; y++){
        VGA_SetChar(terminal->display, VGA_VERTICAL_BAR_CHAR, color_data, tlx, y);
        VGA_SetChar(terminal->display, VGA_VERTICAL_BAR_CHAR, color_data, tlx+width-1, y);
    }

    VGA_SetChar(terminal->display, VGA_TL_CHAR, color_data, tlx, tly);
    VGA_SetChar(terminal->display, VGA_TR_CHAR, color_data, tlx+width-1, tly);
    VGA_SetChar(terminal->display, VGA_BL_CHAR, color_data, tlx, tly+height-1);
    VGA_SetChar(terminal->display, VGA_BR_CHAR, color_data, tlx+width-1, tly+height-1);

    uint8_t str_len = 0;
    char* c = terminal->title; while(*c){str_len++; c++;}
    uint8_t title_length = MIN(str_len+2, width-2);
    uint8_t start_pos = (width-2 - title_length) / 2;

    uint16_t x = tlx + 1 + start_pos;
    uint8_t len = 0;
    c = terminal->title;
    VGA_SetChar(terminal->display, ' ', (((color_data&0x0F)<<4) | ((color_data&0xF0)>>4)), x, tly);
    x++;
    while (*c) {
        VGA_SetChar(terminal->display, *c, (((color_data&0x0F)<<4) | ((color_data&0xF0)>>4)), x, tly);
        x++;
        c++;
        len++;
        if (len==title_length-1){ break; }
    }
    if (len==title_length-1){
        VGA_SetChar(terminal->display, 0xAF, (((color_data&0x0F)<<4) | ((color_data&0xF0)>>4)), x-1, tly);
    }
    else {
        VGA_SetChar(terminal->display, ' ', (((color_data&0x0F)<<4) | ((color_data&0xF0)>>4)), x, tly);
    }
}

void KI_UpdateLineScrolling(KI_Terminal* terminal) {

    while (terminal->cursory >= terminal->inner_height){
        for (int y = 0; y < terminal->inner_height-1; y++){
            for (int x = 0; x < terminal->inner_width; x++){
                uint16_t curr_offset = KI_VGACoordTransform(terminal, x, y);
                uint16_t src_offset = KI_VGACoordTransform(terminal, x, y+1);
                ((uint8_t*)0xB8000)[curr_offset*2] = ((uint8_t*)0xB8000)[src_offset*2];
                ((uint8_t*)0xB8000)[curr_offset*2+1] = ((uint8_t*)0xB8000)[src_offset*2+1];
            }
        }
        for (int x = 0; x < terminal->inner_width; x++) {
            uint16_t offset = KI_VGACoordTransform(terminal, x, terminal->inner_height-1);
            ((uint8_t*)0xB8000)[offset*2] = '\0';
            ((uint8_t*)0xB8000)[offset*2+1] = terminal->color_data;
        }
        terminal->cursorx = 0;
        terminal->cursory -= 1;
    }

}


void KI_Putc(KI_Terminal* terminal, char c) {

    // Make sure cursor is cleared
    uint16_t offset = KI_VGACoordTransform(terminal, terminal->cursorx, terminal->cursory);
    ((uint8_t*)0xB8000)[offset*2] = '\0';
    ((uint8_t*)0xB8000)[offset*2+1] = terminal->color_data;

    if (c=='\n') {
        terminal->cursorx = 0;
        terminal->cursory += 1;
        KI_UpdateLineScrolling(terminal);
    }
    else if (c=='\r') {
        terminal->cursorx = 0;
    }
    else if (c=='\t') {
        for (int i = 0; i<4; i++) {
            KI_Putc(terminal, ' ');
        }
    }
    else if (c=='\b') {
        uint16_t old_x = terminal->cursorx, old_y = terminal->cursory;
        // If there is room to go back on current line
        if (terminal->cursorx > 0) {
            terminal->cursorx -= 1;
        }
        // If this is the very beginning of a new line
        else {
            // If this is not the first line
            if (terminal->cursory > 0) {
                terminal->cursory -= 1;
                uint8_t saved_x = 0;
                // Find the last character of this line
                for (int x = 0; x < terminal->inner_width; x++) {
                    uint16_t offset = KI_VGACoordTransform(terminal, x, terminal->cursory);
                    char c = ((uint8_t*)0xB8000)[offset*2];
                    saved_x = x;
                    if (c == '\0'){break;}
                }
                terminal->cursorx = saved_x;
            }
            // If this is the first line, no need to to anything else
        }
        uint16_t offset = KI_VGACoordTransform(terminal, terminal->cursorx, terminal->cursory);
        if (offset >= terminal->backspace_barrier) {
            ((uint8_t*)0xB8000)[offset*2] = '\0';
            ((uint8_t*)0xB8000)[offset*2+1] = terminal->color_data;
        }
        else {
            terminal->cursorx = old_x;
            terminal->cursory = old_y;
        }
    }

    else {

        KI_UpdateLineScrolling(terminal);

        uint16_t offset = KI_VGACoordTransform(terminal, terminal->cursorx, terminal->cursory);
        ((uint8_t*)0xB8000)[offset*2] = c;
        ((uint8_t*)0xB8000)[offset*2+1] = terminal->color_data;
        terminal->cursorx += 1;
        if (terminal->cursorx >= terminal->width-2){
            terminal->cursorx = 0;
            terminal->cursory += 1;
        }
    }

    terminal->cursor_timer = 0;
    KI_DrawCursor(terminal);

}

void KI_Puts(KI_Terminal* terminal, const char* msg) {
    while (*msg) {
        KI_Putc(terminal, *msg);
        msg++;
    }
}




void KI_BadSizeError(KI_Terminal* terminal) {
    VGA_Display* display = terminal->display;
    VGA_SetCursorPos(display, 0, 0);
    VGA_Write(display, "Error: Invalid dimensions for terminal initialization!", 0x4F);
    for(;;);
}

void KI_TextOverflowError(KI_Terminal* terminal) {
    terminal->cursorx = 1;
    terminal->cursory = 1;
    for(;;);
}