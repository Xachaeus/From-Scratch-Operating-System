#include <stdint.h>

#ifndef VGA_H
#define VGA_H


#define VGA_VERTICAL_BAR_CHAR 186
#define VGA_HORIZONTAL_BAR_CHAR 205

#define VGA_TL_CHAR 201
#define VGA_BL_CHAR 200
#define VGA_TR_CHAR 187
#define VGA_BR_CHAR 188



enum VGA_COLOR {
	VGA_COLOR_BLACK = 0,
	VGA_COLOR_BLUE = 1,
	VGA_COLOR_GREEN = 2,
	VGA_COLOR_CYAN = 3,
	VGA_COLOR_RED = 4,
	VGA_COLOR_MAGENTA = 5,
	VGA_COLOR_BROWN = 6,
	VGA_COLOR_LIGHT_GREY = 7,
	VGA_COLOR_DARK_GREY = 8,
	VGA_COLOR_LIGHT_BLUE = 9,
	VGA_COLOR_LIGHT_GREEN = 10,
	VGA_COLOR_LIGHT_CYAN = 11,
	VGA_COLOR_LIGHT_RED = 12,
	VGA_COLOR_LIGHT_MAGENTA = 13,
	VGA_COLOR_LIGHT_BROWN = 14,
	VGA_COLOR_WHITE = 15,
};


typedef struct {
    uint16_t width;
    uint16_t height;
    uint32_t cursor_pos;
	uint8_t color_data;
} VGA_Display;


uint8_t VGA_ColorData(enum VGA_COLOR fg, enum VGA_COLOR bg);

uint8_t __attribute__((cdecl)) VGA_Initialize(VGA_Display* display, uint8_t color_data);
void __attribute__((cdecl)) VGA_ClearScreen(VGA_Display* display);
void __attribute__((cdecl)) VGA_SetChar(VGA_Display* display, uint8_t c, uint8_t color_data, uint16_t x, uint16_t y);
void __attribute__((cdecl)) VGA_SetCursorPos(VGA_Display* display, uint16_t x, uint16_t y);
void __attribute__((cdecl)) VGA_Print(VGA_Display* display, uint8_t* message);
void __attribute__((cdecl)) VGA_Write(VGA_Display* display, uint8_t* message, uint8_t color_data);

#endif