#include <stdint.h>
#include "VGA.h"




uint8_t VGA_ColorData(enum VGA_COLOR fg, enum VGA_COLOR bg) { 
    return (bg<<4)|fg; 
}


uint8_t __attribute__((cdecl)) VGA_Initialize(VGA_Display* display, uint8_t color_data) {
    display->width = 80;
    display->height = 25;
    display->color_data = color_data;
    display->cursor_pos = 0;
    
    VGA_ClearScreen(display);
    
    return 0;
}


void VGA_ClearScreen(VGA_Display* display) {
    for (uint16_t x = 0; x < display->width; x++) {
        for (uint16_t y = 0; y < display->height; y++) {
            uint32_t index = (y*display->width + x)*2;
            ((uint8_t*)0xB8000)[index] = '\0';
            ((uint8_t*)0xB8000)[index+1] = display->color_data;
        }
    }
}

void __attribute__((cdecl)) VGA_SetChar(VGA_Display* display, uint8_t c, uint8_t color_data, uint16_t x, uint16_t y) {
    uint32_t offset = (y*display->width + x)*2;
    ((uint8_t*)0xB8000)[offset] = c;
    ((uint8_t*)0xB8000)[offset+1] = color_data;
}

void __attribute__((cdecl)) VGA_SetCursorPos(VGA_Display* display, uint16_t x, uint16_t y) {
    display->cursor_pos = y*display->width + x;
}

void __attribute__((cdecl)) VGA_Print(VGA_Display* display, uint8_t* message) {
    while (*message) {
        int offset = display->cursor_pos;
        if (*message=='\n'){
            offset = ((offset / display->width)+1) * display->width;
        }
        else{
            ((uint16_t*)0xB8000)[offset] = (display->color_data<<8) | (*message);
            offset += 1;
        }
        display->cursor_pos = offset;
        message++;
    }
}

void __attribute__((cdecl)) VGA_Write(VGA_Display* display, uint8_t* message, uint8_t color_data) {
    while (*message) {
        int offset = display->cursor_pos;
        if (*message=='\n'){
            offset = ((offset / display->width)+1) * display->width;
        }
        else{
            ((uint16_t*)0xB8000)[offset] = (color_data<<8) | (*message);
            offset += 1;
        }
        display->cursor_pos = offset;
        message++;
    }
}