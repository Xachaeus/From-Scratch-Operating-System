#include <stdint.h>
#include "VGA.h"

#ifndef KI_H
#define KI_H

typedef struct {
    VGA_Display* display;
    uint16_t width;
    uint16_t height;
    uint16_t inner_width;
    uint16_t inner_height;
    uint16_t cursorx;
    uint16_t cursory;
    uint32_t cursor_timer;
    uint8_t cursor_blinking_enabled;
    uint8_t cursor_char;
    uint16_t backspace_barrier;
    uint16_t tlx;
    uint16_t tly;
    uint8_t color_data;
    char* title;
    uint8_t input_buffer[256];
    uint8_t input_buffer_tail;
} KI_Terminal;

void KI_CursorHook(KI_Terminal* terminal, uint32_t time_passed);

uint16_t KI_VGACoordTransform(KI_Terminal* terminal, uint16_t x, uint16_t y);

void KI_Initialize(KI_Terminal* terminal, VGA_Display* display, uint16_t tlx, uint16_t tly, uint16_t width, uint16_t height, uint8_t color_data, char* title);
void KI_DrawBorder();
void KI_Putc(KI_Terminal* terminal, char c);
void KI_Puts(KI_Terminal* terminal, const char* msg);

void KI_DisableBlinking();
void KI_EnableBlinking();


void KI_BadSizeError(KI_Terminal* terminal);
void KI_Clear(KI_Terminal* terminal);


#endif