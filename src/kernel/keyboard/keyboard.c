
#include "keyboard.h"
#include <stdio.h>
#include <display/kinter.h>
#include <hardware-io/io.h>

#define KEYBOARD_DATA_PORT 0x60

uint8_t g_ControlKeyStates[] = {
    0, // ESC
    0, // ctrl
    0, // Shift
    0, // alt
};


uint8_t GetQWERTYCTRLMakeKeyCode(uint8_t data) {
    switch (data) {
        case 0x01: // Esc
            return 0;
        case 0x1d: // Ctrl
            return 1;
        case 0x2a: // L_shift
        case 0x36: // R_shift
            return 2;
        case 0x38: // Alt
            return 3;
        default:   // Non-ctrl key
            return 0xff;
    }
}

uint8_t GetQWERTYCTRLClearKeyCode(uint8_t data) {
    switch (data) {
        case 0x81: // Esc
            return 0;
        case 0x9d: // Ctrl
            return 1;
        case 0xaa: // L_shift
        case 0xb6: // R_shift
            return 2;
        case 0xb8: // Alt
            return 3;
        default:   // Non-ctrl key
            return 0xff;
    }
}

// Mapping of QWERTY scancodes (index) to ASCII characters
uint8_t g_QWERTY_make_scancodes_shifted[] = {

    '\0',  // Null
    '\0',  // ESC

    // Codes 0x02-0x0d
    '!', '@', '#', '$', '%', '^', '&', '*', '(', ')', '_', '+',

    '\b',  // Backspace
    '\t',  // Tab

    // Codes 0x10-0x1b
    'Q', 'W', 'E', 'R', 'T', 'Y', 'U', 'I', 'O', 'P', '{', '}',

    '\n',  // Enter
    '\0',  // CTRL

    // Codes 0x1e-0x29
    'A', 'S', 'D', 'F', 'G', 'H', 'J', 'K', 'L', ':', '\"', '~', 

    '\0',  // l_Shift

    // Codes 0x2b-0x35
    '|', 'Z', 'X', 'C', 'V', 'B', 'N', 'M', '<', '>', '?',

    '\0',  // r_Shift
    '\0',  // PrtSc
    '\0',  // Alt

    // Code 0x39
    ' '
};


uint8_t g_QWERTY_make_scancodes_unshifted[] = {

    '\0',  // Null
    '\0',  // ESC

    // Codes 0x02-0x0d
    '1', '2', '3', '4', '5', '6', '7', '8', '9', '0', '-', '=',

    '\b',  // Backspace
    '\t',  // Tab

    // Codes 0x10-0x1b
    'q', 'w', 'e', 'r', 't', 'y', 'u', 'i', 'o', 'p', '[', ']',

    '\n',  // Enter
    '\0',  // CTRL

    // Codes 0x1e-0x29
    'a', 's', 'd', 'f', 'g', 'h', 'j', 'k', 'l', ';', '\'', '`', 

    '\0',  // l_Shift

    // Codes 0x2b-0x35
    '\\', 'z', 'x', 'c', 'v', 'b', 'n', 'm', ',', '.', '/',

    '\0',  // r_Shift
    '\0',  // PrtSc
    '\0',  // Alt

    // Code 0x39
    ' '
};



uint8_t g_E0_Received = 0;

void Keyboard_Handler(Registers* regs) {
    KI_Terminal* ActiveTerminal = GetActiveContext();
    uint8_t data = i686_inb(KEYBOARD_DATA_PORT);
    if (data == 0xE0) {g_E0_Received = 1; return;} // Set that we've received E0

    switch (g_E0_Received) {

        case 0: // No E0 sent first

        if (data <= 0x53) { // If this is a "make" scancode

            uint8_t ctrl_code_index = GetQWERTYCTRLMakeKeyCode(data);

            if (ctrl_code_index == 255) { // Normal text usage
                char ascii_character = (g_ControlKeyStates[2]) ? g_QWERTY_make_scancodes_shifted[data] : g_QWERTY_make_scancodes_unshifted[data];
                ActiveContextKeyboardHook(ascii_character);
            }
            else {  // Control Key usage
                g_ControlKeyStates[ctrl_code_index] = 1;
            }
        }

        else { // If this is a "clear" scancode

            uint8_t ctrl_code_index = GetQWERTYCTRLClearKeyCode(data);

            if (ctrl_code_index == 255) { // Normal text usage
                // No need to do aything special yet
            }
            else {  // Control Key usage
                g_ControlKeyStates[ctrl_code_index] = 0;
            }
        }

        break;

        case 1: // E0 received first
            // For now, just ignore

        break;
    }

    g_E0_Received = 0;

}
