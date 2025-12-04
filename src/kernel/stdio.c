#include <stdint.h>
#include <stdbool.h>
#include <stdarg.h>
#include "stdio.h"
#include "display/VGA.h"
#include "display/kinter.h"


#define putc(c) __STD_Putc(c)

VGA_Display g_VGA_Display;
KI_Terminal g_Root_Terminal;

KI_Terminal* g_ActiveContext;

#define STDLEN 512
char g_STDOUT[STDLEN];
char g_STDIN[10];
char g_STDERR[STDLEN];
uint16_t g_STDOUT_TAIL = 0;
uint16_t g_STDIN_TAIL = 0;
uint16_t g_STDERR_TAIL = 0;

void initialize_stdio(uint8_t color_data) {
    VGA_Initialize(&g_VGA_Display, color_data);
    KI_Initialize(&g_Root_Terminal, &g_VGA_Display, 1, 1, 78, 23, color_data, "Root Terminal");
    g_ActiveContext = &g_Root_Terminal;
}

KI_Terminal* GetActiveContext() {
    return g_ActiveContext;
}

char* GetSTDOUT() {
    return g_STDOUT;
}
char* GetSTDIN() {
    return g_STDIN;
}
char* GetSTDERR() {
    return g_STDERR;
}

void STD_PutBuffer(char* buffer, char* src) {
    char* b = buffer; char* s = src;
    while (*s) {
        *b = *s;
        b++; s++;
    }
}

int STD_GetBuffer(char* buffer, char* dest) {
    int read = 0;
    char* b = buffer; char* d = dest;
    while (*b) {
        *d = *b;
        d++; b++; read++;
    }
    return read;
}

void STD_FlushSTDOUT() {
    KI_Puts(g_ActiveContext, g_STDOUT);
    for (int i = 0; i < STDLEN; i++) {
        g_STDOUT[i] = '\0';
    }
    g_STDOUT_TAIL = 0;
}
void STD_FlushSTDIN() {
    for (int i = 0; i < STDLEN; i++) {
        g_STDIN[i] = '\0';
    }
    g_STDIN_TAIL = 0;
}
void STD_FlushSTDERR() {
    for (int i = 0; i < STDLEN; i++) {
        g_STDERR[i] = '\0';
    }
    g_STDERR_TAIL = 0;
}


void ActiveContextTimerCursorHook(uint32_t time_passed) {
    KI_CursorHook(g_ActiveContext, time_passed);
}

void ActiveContextKeyboardHook(char key_pressed) {
    if (key_pressed == '\b') {
        if(g_STDIN_TAIL>0){g_STDIN_TAIL -= 1;}
        g_STDIN[g_STDIN_TAIL] = '\0';
    }
    else {
        g_STDIN[g_STDIN_TAIL] = key_pressed;
        g_STDIN_TAIL++;
    }
    if (g_STDIN_TAIL+1 >= STDLEN) {
        for (int i=0; i<STDLEN-2; i++){
            g_STDIN[i] = g_STDIN[i+1];
        }
        g_STDIN[STDLEN-1] = '\0';
        g_STDIN_TAIL = STDLEN-2;
    }
    KI_Putc(g_ActiveContext, key_pressed);
}

void CFG_EnableCursorBlinking() {
    g_ActiveContext->cursor_blinking_enabled = 1;
}
void CFG_DisableCursorBlinking() {
    g_ActiveContext->cursor_blinking_enabled = 0;
}
void CFG_SetCursorChar(char c) {
    g_ActiveContext->cursor_char = c;
}




void __STD_Putc(char c) {
    g_STDOUT[g_STDOUT_TAIL] = c;
    g_STDOUT_TAIL++;
}

void __STD_Puts(const char* s) {
    while (*s) {
        __STD_Putc(*s);
        s++;
    }
}

const char g_HexChars[] = "0123456789abcdef";


void printf_unsigned(unsigned long long number, int radix)
{
    char buffer[32];
    int pos = 0;

    // convert number to ASCII
    do 
    {
        unsigned long long rem = number % radix;
        number /= radix;
        buffer[pos++] = g_HexChars[rem];
    } while (number > 0);

    // print number in reverse order
    while (--pos >= 0)
        putc(buffer[pos]);
}

void printf_signed(long long number, int radix)
{
    if (number < 0)
    {
        putc('-');
        printf_unsigned(-number, radix);
    }
    else printf_unsigned(number, radix);
}

#define PRINTF_STATE_NORMAL         0
#define PRINTF_STATE_LENGTH         1
#define PRINTF_STATE_LENGTH_SHORT   2
#define PRINTF_STATE_LENGTH_LONG    3
#define PRINTF_STATE_SPEC           4

#define PRINTF_LENGTH_DEFAULT       0
#define PRINTF_LENGTH_SHORT_SHORT   1
#define PRINTF_LENGTH_SHORT         2
#define PRINTF_LENGTH_LONG          3
#define PRINTF_LENGTH_LONG_LONG     4

void __attribute__((cdecl)) printf(const char* fmt, ...)
{

    KI_DisableBlinking();

    va_list args;
    va_start(args, fmt);

    int state = PRINTF_STATE_NORMAL;
    int length = PRINTF_LENGTH_DEFAULT;
    int radix = 10;
    bool sign = false;
    bool number = false;

    while (*fmt)
    {
        switch (state)
        {
            case PRINTF_STATE_NORMAL:
                switch (*fmt)
                {
                    case '%':   state = PRINTF_STATE_LENGTH;
                                break;

                    default:    putc(*fmt);
                                break;
                }
                break;

            case PRINTF_STATE_LENGTH:
                switch (*fmt)
                {
                    case 'h':   length = PRINTF_LENGTH_SHORT;
                                state = PRINTF_STATE_LENGTH_SHORT;
                                break;
                    case 'l':   length = PRINTF_LENGTH_LONG;
                                state = PRINTF_STATE_LENGTH_LONG;
                                break;
                    default:    goto PRINTF_STATE_SPEC_;
                }
                break;

            case PRINTF_STATE_LENGTH_SHORT:
                if (*fmt == 'h')
                {
                    length = PRINTF_LENGTH_SHORT_SHORT;
                    state = PRINTF_STATE_SPEC;
                }
                else goto PRINTF_STATE_SPEC_;
                break;

            case PRINTF_STATE_LENGTH_LONG:
                if (*fmt == 'l')
                {
                    length = PRINTF_LENGTH_LONG_LONG;
                    state = PRINTF_STATE_SPEC;
                }
                else goto PRINTF_STATE_SPEC_;
                break;

            case PRINTF_STATE_SPEC:
            PRINTF_STATE_SPEC_:
                switch (*fmt)
                {
                    case 'c':   putc((char)va_arg(args, int));
                                break;

                    case 's':   __STD_Puts(va_arg(args, const char*));
                                break;

                    case '%':   putc('%');
                                break;

                    case 'd':
                    case 'i':   radix = 10; sign = true; number = true;
                                break;

                    case 'u':   radix = 10; sign = false; number = true;
                                break;

                    case 'X':
                    case 'x':
                    case 'p':   radix = 16; sign = false; number = true;
                                break;

                    case 'o':   radix = 8; sign = false; number = true;
                                break;

                    // ignore invalid spec
                    default:    break;
                }

                if (number)
                {
                    if (sign)
                    {
                        switch (length)
                        {
                        case PRINTF_LENGTH_SHORT_SHORT:
                        case PRINTF_LENGTH_SHORT:
                        case PRINTF_LENGTH_DEFAULT:     printf_signed(va_arg(args, int), radix);
                                                        break;

                        case PRINTF_LENGTH_LONG:        printf_signed(va_arg(args, long), radix);
                                                        break;

                        case PRINTF_LENGTH_LONG_LONG:   printf_signed(va_arg(args, long long), radix);
                                                        break;
                        }
                    }
                    else
                    {
                        switch (length)
                        {
                        case PRINTF_LENGTH_SHORT_SHORT:
                        case PRINTF_LENGTH_SHORT:
                        case PRINTF_LENGTH_DEFAULT:     printf_unsigned(va_arg(args, unsigned int), radix);
                                                        break;
                                                        
                        case PRINTF_LENGTH_LONG:        printf_unsigned(va_arg(args, unsigned  long), radix);
                                                        break;

                        case PRINTF_LENGTH_LONG_LONG:   printf_unsigned(va_arg(args, unsigned  long long), radix);
                                                        break;
                        }
                    }
                }

                // reset state
                state = PRINTF_STATE_NORMAL;
                length = PRINTF_LENGTH_DEFAULT;
                radix = 10;
                sign = false;
                number = false;
                break;
        }

        fmt++;
    }

    va_end(args);
    STD_FlushSTDOUT();

    KI_EnableBlinking();
}



int hex_to_dec(char c) {
    switch (c) {
        case '0': return 0;
        case '1': return 1;
        case '2': return 2;
        case '3': return 3;
        case '4': return 4;
        case '5': return 5;
        case '6': return 6;
        case '7': return 7;
        case '8': return 8;
        case '9': return 9;
        case 'A':
        case 'a': return 10;
        case 'B':
        case 'b': return 11;
        case 'C':
        case 'c': return 12;
        case 'D':
        case 'd': return 13;
        case 'E':
        case 'e': return 14;
        case 'F':
        case 'f': return 15;
        default: return -1;
    }
}


int __attribute__((cdecl)) scanf(const char* fmt, ...) {
    va_list args;
    va_start(args, fmt);

    g_ActiveContext->backspace_barrier = KI_VGACoordTransform(g_ActiveContext, g_ActiveContext->cursorx, g_ActiveContext->cursory);
    while (true) {
        if (g_STDIN_TAIL > 0){
            if (g_STDIN[g_STDIN_TAIL-1] == '\n') {g_STDIN[g_STDIN_TAIL-1] = '\0'; break;}
        }
        // Busy wait until a newline is found
    } // STDIN should now contain the requested line

    int count = 0; // Count how many values are read

    char* input = g_STDIN;
    int SCANF_FORMAT_STATE = 0;

    uint8_t long_modifier_count = 0;
    uint8_t short_modifier_count = 0;

    uint64_t value;
    uint8_t length_modifier_amount;
    int sign;

    while(*fmt) {
        switch (SCANF_FORMAT_STATE) {

            case 0: // No special character detected

                long_modifier_count = 0;
                short_modifier_count = 0;

                if (*fmt == '%') { // Locate format specifiers
                    SCANF_FORMAT_STATE = 1;
                }
                else { // If no format specifier is given, make sure input string matches format string exactly
                    if (*input != *fmt) { // Check for mismatch
                        goto SCANF_BAD_INPUT_ERROR;
                    }
                    else { // Otherwise, update position within input
                        input++;
                    }
                }
                break;
            
            case 1: // Format specifier has been found, now need to parse exact type
                switch (*fmt) {

                    case 'l': // At least one "long" modifier
                        long_modifier_count++;
                        break;


                    case 'h': // At least one "short" modifier
                        short_modifier_count++;
                        break;


                    case 'i': // Signed integer
                    case 'd':

                        length_modifier_amount = 2 + long_modifier_count - short_modifier_count; // Get a single value to represent intended length
                        if (length_modifier_amount > 4 || length_modifier_amount < 0) {
                            goto SCANF_BAD_FORMAT_ERROR;
                        }
                        if (*input == '-') {sign = 1; input++;}  // Is input number negative?
                        else {sign = 0;}                         // Is input number positive?
                        if (*input < '0' || *input > '9') {goto SCANF_BAD_INPUT_ERROR;} // If the current character of input is not a number, exit

                        // Get the numeric value from STDIN
                        value = 0;
                        while (*input != ' ' && *input != '\0' && *input != '\t') { // Run until a valid stop character is found
                            if (*input < '0' || *input > '9') {goto SCANF_BAD_INPUT_ERROR;} // If the current character of input is not a number, exit
                            value = (value * 10) + (*input - '0'); // Shift value over one decimal place and add number value
                            input++;
                        }
                        if (sign) {value = ~value + 1;} // Get the two's complement if negative

                        switch (length_modifier_amount) {
                            case 0: // Short Short  (1 byte)
                                *((uint8_t*)(va_arg(args, uint8_t*))) = 0x00000000000000FF & value;
                                break;
                            case 1: // Short        (2 bytes) 
                                *((uint16_t*)(va_arg(args, uint16_t*))) = 0x000000000000FFFF & value;
                                break;
                            case 2: // Normal       (4 bytes)
                            case 3: // Long         (4 bytes)
                                *((uint32_t*)(va_arg(args, uint32_t*))) = 0x00000000FFFFFFFF & value;
                                break;
                            case 4: // Long Long    (8 bytes)
                                *((uint64_t*)(va_arg(args, uint64_t*))) = 0xFFFFFFFFFFFFFFFF & value;
                                break;
                        }
                        count += 1; // Record a value found
                        SCANF_FORMAT_STATE = 0;
                        break;


                    case 'u': // Unsigned integer

                        length_modifier_amount = 2 + long_modifier_count - short_modifier_count; // Get a single value to represent intended length
                        if (length_modifier_amount > 4 || length_modifier_amount < 0) {
                            goto SCANF_BAD_FORMAT_ERROR;
                        }
                        if (*input < '0' || *input > '9') {goto SCANF_BAD_INPUT_ERROR;} // If the current character of input is not a number, exit

                        // Get the numeric value from STDIN
                        value = 0;
                        while (*input != ' ' && *input != '\0' && *input != '\t') { // Run until a valid stop character is found
                            if ((*input > '0' && *input < '9') || (*input > 'a')) {goto SCANF_BAD_INPUT_ERROR;} // If the current character of input is not a number, exit
                            value = (value * 10) + (*input - '0'); // Shift value over one decimal place and add number value
                            input++;
                        }

                        switch (length_modifier_amount) {
                            case 0: // Short Short  (1 byte)
                                *((uint8_t*)(va_arg(args, uint8_t*))) = 0x00000000000000FF & value;
                                break;
                            case 1: // Short        (2 bytes) 
                                *((uint16_t*)(va_arg(args, uint16_t*))) = 0x000000000000FFFF & value;
                                break;
                            case 2: // Normal       (4 bytes)
                            case 3: // Long         (4 bytes)
                                *((uint32_t*)(va_arg(args, uint32_t*))) = 0x00000000FFFFFFFF & value;
                                break;
                            case 4: // Long Long    (8 bytes)
                                *((uint64_t*)(va_arg(args, uint64_t*))) = 0xFFFFFFFFFFFFFFFF & value;
                                break;
                        }
                        count += 1; // Record a value found
                        SCANF_FORMAT_STATE = 0;
                        break;


                    case 'X': // Unsigned integer in hex
                    case 'p':
                    case 'x':
                        
                        length_modifier_amount = 2 + long_modifier_count - short_modifier_count; // Get a single value to represent intended length
                        if (length_modifier_amount > 4 || length_modifier_amount < 0) {
                            goto SCANF_BAD_FORMAT_ERROR;
                        }

                        if (hex_to_dec(*input) < 0) {goto SCANF_BAD_INPUT_ERROR;} // If the current character of input is not a number, exit

                        // Get the numeric value from STDIN
                        value = 0;
                        while (*input != ' ' && *input != '\0' && *input != '\t') { // Run until a valid stop character is found
                            if (hex_to_dec(*input) < 0) {goto SCANF_BAD_INPUT_ERROR;} // If the current character of input is not a number, exit
                            value = (value * 16) + (hex_to_dec(*input)); // Shift value over one decimal place and add number value
                            input++;
                        }

                        switch (length_modifier_amount) {
                            case 0: // Short Short  (1 byte)
                                *((uint8_t*)(va_arg(args, uint8_t*))) = 0x00000000000000FF & value;
                                break;
                            case 1: // Short        (2 bytes) 
                                *((uint16_t*)(va_arg(args, uint16_t*))) = 0x000000000000FFFF & value;
                                break;
                            case 2: // Normal       (4 bytes)
                            case 3: // Long         (4 bytes)
                                *((uint32_t*)(va_arg(args, uint32_t*))) = 0x00000000FFFFFFFF & value;
                                break;
                            case 4: // Long Long    (8 bytes)
                                *((uint64_t*)(va_arg(args, uint64_t*))) = 0xFFFFFFFFFFFFFFFF & value;
                                break;
                        }
                        count += 1; // Record a value found
                        SCANF_FORMAT_STATE = 0;
                        break;


                    case 'o': // Unsigned integer in octal
                        SCANF_FORMAT_STATE = 0;
                        break;


                    case 'c': // Char
                        *((char*)(va_arg(args, char*))) = *input;
                        input++;
                        count += 1;
                        SCANF_FORMAT_STATE = 0;
                        break;


                    case 's': // String
                        char* s = (char*)(va_arg(args, char*));
                        while (*input != ' ' && *input != '\0' && *input != '\t') {
                            *s = *input;
                            s++; input++;
                        }
                        count += 1;
                        SCANF_FORMAT_STATE = 0;
                        break;


                    case '%': // Percent
                        if (*input != '%') {
                            goto SCANF_BAD_INPUT_ERROR;
                        }
                        else {
                            input++;
                            count += 1;
                        }
                        SCANF_FORMAT_STATE = 0;
                        break;


                    default: // Invalid character
                        goto SCANF_BAD_FORMAT_ERROR;
                }
 
        }
        fmt++;
    }

    SCANF_BAD_INPUT_ERROR:
    SCANF_VALID_INPUT:
    /* IMPORTANT!!! FLUSH BUFFER!! */
    STD_FlushSTDIN();
    return count;

    /* This is just to copy stdin into a string
    char* c = g_STDIN; char* d = va_arg(args, char*);
    int count = 0;
    while (*c) {
        *d = *c;
        d++; c++;
        count++;
    }
    */

    SCANF_BAD_FORMAT_ERROR:
    STD_FlushSTDIN();
    return -1;
}


void __attribute__((cdecl)) getline(char* dest, int max_len) {
    g_ActiveContext->backspace_barrier = KI_VGACoordTransform(g_ActiveContext, g_ActiveContext->cursorx, g_ActiveContext->cursory);
    while (true) {
        if (g_STDIN_TAIL > 0){
            if (g_STDIN[g_STDIN_TAIL-1] == '\n') {g_STDIN[g_STDIN_TAIL-1] = '\0'; break;}
        }
        // Busy wait until a newline is found
    } // STDIN should now contain the requested line
    for (int i = 0; i < ((g_STDIN_TAIL > max_len) ? max_len : g_STDIN_TAIL); i++) {
        *dest = g_STDIN[i]; dest++;
    }
    STD_FlushSTDIN();
    return;
}





int __attribute__((cdecl)) sscanf(const char* buffer, const char* fmt, ...) {
    va_list args;
    va_start(args, fmt);

    int count = 0; // Count how many values are read

    const char* input = buffer;
    int SCANF_FORMAT_STATE = 0;

    uint8_t long_modifier_count = 0;
    uint8_t short_modifier_count = 0;

    uint64_t value;
    uint8_t length_modifier_amount;
    int sign;

    while(*fmt) {
        switch (SCANF_FORMAT_STATE) {

            case 0: // No special character detected

                long_modifier_count = 0;
                short_modifier_count = 0;

                if (*fmt == '%') { // Locate format specifiers
                    SCANF_FORMAT_STATE = 1;
                }
                else { // If no format specifier is given, make sure input string matches format string exactly
                    if (*input != *fmt) { // Check for mismatch
                        goto SCANF_BAD_INPUT_ERROR;
                    }
                    else { // Otherwise, update position within input
                        input++;
                    }
                }
                break;
            
            case 1: // Format specifier has been found, now need to parse exact type
                switch (*fmt) {

                    case 'l': // At least one "long" modifier
                        long_modifier_count++;
                        break;


                    case 'h': // At least one "short" modifier
                        short_modifier_count++;
                        break;


                    case 'i': // Signed integer
                    case 'd':

                        length_modifier_amount = 2 + long_modifier_count - short_modifier_count; // Get a single value to represent intended length
                        if (length_modifier_amount > 4 || length_modifier_amount < 0) {
                            goto SCANF_BAD_FORMAT_ERROR;
                        }
                        if (*input == '-') {sign = 1; input++;}  // Is input number negative?
                        else {sign = 0;}                         // Is input number positive?
                        if (*input < '0' || *input > '9') {goto SCANF_BAD_INPUT_ERROR;} // If the current character of input is not a number, exit

                        // Get the numeric value from STDIN
                        value = 0;
                        while (*input != ' ' && *input != '\0' && *input != '\t') { // Run until a valid stop character is found
                            if (*input < '0' || *input > '9') {goto SCANF_BAD_INPUT_ERROR;} // If the current character of input is not a number, exit
                            value = (value * 10) + (*input - '0'); // Shift value over one decimal place and add number value
                            input++;
                        }
                        if (sign) {value = ~value + 1;} // Get the two's complement if negative

                        switch (length_modifier_amount) {
                            case 0: // Short Short  (1 byte)
                                *((uint8_t*)(va_arg(args, uint8_t*))) = 0x00000000000000FF & value;
                                break;
                            case 1: // Short        (2 bytes) 
                                *((uint16_t*)(va_arg(args, uint16_t*))) = 0x000000000000FFFF & value;
                                break;
                            case 2: // Normal       (4 bytes)
                            case 3: // Long         (4 bytes)
                                *((uint32_t*)(va_arg(args, uint32_t*))) = 0x00000000FFFFFFFF & value;
                                break;
                            case 4: // Long Long    (8 bytes)
                                *((uint64_t*)(va_arg(args, uint64_t*))) = 0xFFFFFFFFFFFFFFFF & value;
                                break;
                        }
                        count += 1; // Record a value found
                        SCANF_FORMAT_STATE = 0;
                        break;


                    case 'u': // Unsigned integer

                        length_modifier_amount = 2 + long_modifier_count - short_modifier_count; // Get a single value to represent intended length
                        if (length_modifier_amount > 4 || length_modifier_amount < 0) {
                            goto SCANF_BAD_FORMAT_ERROR;
                        }
                        if (*input < '0' || *input > '9') {goto SCANF_BAD_INPUT_ERROR;} // If the current character of input is not a number, exit

                        // Get the numeric value from STDIN
                        value = 0;
                        while (*input != ' ' && *input != '\0' && *input != '\t') { // Run until a valid stop character is found
                            if ((*input > '0' && *input < '9') || (*input > 'a')) {goto SCANF_BAD_INPUT_ERROR;} // If the current character of input is not a number, exit
                            value = (value * 10) + (*input - '0'); // Shift value over one decimal place and add number value
                            input++;
                        }

                        switch (length_modifier_amount) {
                            case 0: // Short Short  (1 byte)
                                *((uint8_t*)(va_arg(args, uint8_t*))) = 0x00000000000000FF & value;
                                break;
                            case 1: // Short        (2 bytes) 
                                *((uint16_t*)(va_arg(args, uint16_t*))) = 0x000000000000FFFF & value;
                                break;
                            case 2: // Normal       (4 bytes)
                            case 3: // Long         (4 bytes)
                                *((uint32_t*)(va_arg(args, uint32_t*))) = 0x00000000FFFFFFFF & value;
                                break;
                            case 4: // Long Long    (8 bytes)
                                *((uint64_t*)(va_arg(args, uint64_t*))) = 0xFFFFFFFFFFFFFFFF & value;
                                break;
                        }
                        count += 1; // Record a value found
                        SCANF_FORMAT_STATE = 0;
                        break;


                    case 'X': // Unsigned integer in hex
                    case 'p':
                    case 'x':
                        
                        length_modifier_amount = 2 + long_modifier_count - short_modifier_count; // Get a single value to represent intended length
                        if (length_modifier_amount > 4 || length_modifier_amount < 0) {
                            goto SCANF_BAD_FORMAT_ERROR;
                        }

                        if (hex_to_dec(*input) < 0) {goto SCANF_BAD_INPUT_ERROR;} // If the current character of input is not a number, exit

                        // Get the numeric value from the buffer
                        value = 0;
                        while (*input != ' ' && *input != '\0' && *input != '\t') { // Run until a valid stop character is found
                            if (hex_to_dec(*input) < 0) {goto SCANF_BAD_INPUT_ERROR;} // If the current character of input is not a number, exit
                            value = (value * 16) + (hex_to_dec(*input)); // Shift value over one decimal place and add number value
                            input++;
                        }

                        switch (length_modifier_amount) {
                            case 0: // Short Short  (1 byte)
                                *((uint8_t*)(va_arg(args, uint8_t*))) = 0x00000000000000FF & value;
                                break;
                            case 1: // Short        (2 bytes) 
                                *((uint16_t*)(va_arg(args, uint16_t*))) = 0x000000000000FFFF & value;
                                break;
                            case 2: // Normal       (4 bytes)
                            case 3: // Long         (4 bytes)
                                *((uint32_t*)(va_arg(args, uint32_t*))) = 0x00000000FFFFFFFF & value;
                                break;
                            case 4: // Long Long    (8 bytes)
                                *((uint64_t*)(va_arg(args, uint64_t*))) = 0xFFFFFFFFFFFFFFFF & value;
                                break;
                        }
                        count += 1; // Record a value found
                        SCANF_FORMAT_STATE = 0;
                        break;


                    case 'o': // Unsigned integer in octal
                        SCANF_FORMAT_STATE = 0;
                        break;


                    case 'c': // Char
                        *((char*)(va_arg(args, char*))) = *input;
                        input++;
                        count += 1;
                        SCANF_FORMAT_STATE = 0;
                        break;


                    case 's': // String
                        char* s = (char*)(va_arg(args, char*));
                        while (*input != ' ' && *input != '\0' && *input != '\t') {
                            *s = *input;
                            s++; input++;
                        }
                        count += 1;
                        SCANF_FORMAT_STATE = 0;
                        break;


                    case '%': // Percent
                        if (*input != '%') {
                            goto SCANF_BAD_INPUT_ERROR;
                        }
                        else {
                            input++;
                            count += 1;
                        }
                        SCANF_FORMAT_STATE = 0;
                        break;


                    default: // Invalid character
                        goto SCANF_BAD_FORMAT_ERROR;
                }
 
        }
        fmt++;
    }

    SCANF_BAD_INPUT_ERROR:
    SCANF_VALID_INPUT:
    return count;

    SCANF_BAD_FORMAT_ERROR:
    return -1;
}

