#ifndef CLI_H
#define CLI_H

typedef void (*CMDHandler)(int argc, const char** argv);

#include <stdio.h>

int CLI_Mainloop();

#endif
