//
// Created by Frodo on 2019-04-07.
//

#include "debug.h"

#ifndef NO_CURSES
    #include <curses.h>
#endif
#ifdef __EMSCRIPTEN__
#include <stdio.h>
#include <stdarg.h>
#endif
#include <stdlib.h>
#include <memory.h>
#include "debug.h"

int debugStartX  = 360;
int debugMaxY = 100;
int debugPosY = 0;
void curseDebug(char * cstr){
#ifdef NO_DEBUG
    return;
#endif
#ifdef NO_CURSES
    printf(cstr);
    return;
#endif


    if (debugPosY > debugMaxY) {
        debugPosY = 0;
    } else {
        debugPosY++;
    }
    // Clear the space
    // mvprintw(debugPosY, debugStartX, "                                                 ");
#ifndef NO_CURSES
    mvprintw(debugPosY, debugStartX, cstr);
    refresh();
#endif
}

void cPrintf(const char * format,  ...) {
#ifdef NO_DEBUG
    return;
#endif
    char * newfmt = malloc(strlen(format) * 2 + 10);
    va_list args;
    va_start(args, format);
    vsprintf(newfmt, format, args);
    va_end(args);
    curseDebug(newfmt);
    free(newfmt);
}
