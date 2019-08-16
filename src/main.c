/*
 * Copyright 2011 The Emscripten Authors.  All rights reserved.
 * Emscripten is available under two separate licenses, the MIT license and the
 * University of Illinois/NCSA Open Source License.  Both these licenses can be
 * found in the LICENSE file.
 */

#include <stdio.h>
#include <emscripten.h>

int main() {
    char test[] = "five\n";
    while (1) {
        emscripten_sleep(1000);
        EM_ASM_({readBytes($0, $1);},test,5);
    }
    return 0;
}