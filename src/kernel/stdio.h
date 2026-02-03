
#ifndef STDIO_H
#define STDIO_H

#define STD_DEFAULT_COLOR   0x1F
#define STD_BNW_COLOR       0x0F
#define STD_PWS_COLOR       0x1F
#define STD_HACKER_COLOR    0x02
#define STD_GODAWFUL_COLOR  0x54
#define STD_URGENT_COLOR    0x04

#include <stdint.h>
#include "display/VGA.h"
#include "display/kinter.h"

void initialize_stdio(uint8_t color_data);
void ActiveContextTimerCursorHook(uint32_t time_passed);
void ActiveContextKeyboardHook(char key_pressed);
void CFG_EnableCursorBlinking();
void CFG_DisableCursorBlinking();
void CFG_SetCursorChar(char c);
KI_Terminal* GetActiveContext();
char* GetSTDOUT();
char* GetSTDIN();
char* GetSTDERR();
void STD_PutBuffer(char* buffer, char* src);
int STD_GetBuffer(char* buffer, char* dest);
void PutsK(const char* s, int k);
void __attribute__((cdecl)) printf(const char* fmt, ...);
int __attribute__((cdecl)) scanf(const char* fmt, ...);
int __attribute__((cdecl)) sscanf(const char* buffer, const char* fmt, ...);
void __attribute__((cdecl)) getline(char* dest, int max_len);

#endif

