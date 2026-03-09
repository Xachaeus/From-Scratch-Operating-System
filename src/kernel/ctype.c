#include "ctype.h"
#include <stdbool.h>


bool islower(char chr) { return chr >= 'a' && chr <= 'z'; }
bool isalpha(char chr) { return (chr >= 'a' && chr <= 'z') || (chr >= 'A' && chr <= 'Z'); }
char toupper(char chr) { return islower(chr) && isalpha(chr) ? chr - 'a' + 'A' : chr; } 
char tolower(char chr) { return islower(chr) || !isalpha(chr) ? chr : chr - 'A' + 'a'; } 