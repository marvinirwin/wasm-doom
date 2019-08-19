#!/usr/bin/env bash
export EMMAKEN_CFLAGS="-s ERROR_ON_UNDEFINED_SYMBOLS=0"
WASM_FILENAME=wasm-doom.wasm
JS_FILENAME=react-wasm/src/wasm/wasm-doom.js

sudo docker run --rm -v $(pwd):/src trzeci/emscripten emconfigure cmake .
sudo docker run --rm -v $(pwd):/src trzeci/emscripten emmake  make

sudo docker run --rm -v $(pwd):/src trzeci/emscripten emcc \
    CMakeFiles/wasm-doom.dir/src/DOOM/linuxdoom-1.10/am_map.c.o \
    CMakeFiles/wasm-doom.dir/src/DOOM/linuxdoom-1.10/bitmap.c.o \
    CMakeFiles/wasm-doom.dir/src/DOOM/linuxdoom-1.10/color.c.o \
    CMakeFiles/wasm-doom.dir/src/DOOM/linuxdoom-1.10/d_items.c.o \
    CMakeFiles/wasm-doom.dir/src/DOOM/linuxdoom-1.10/d_main.c.o \
    CMakeFiles/wasm-doom.dir/src/DOOM/linuxdoom-1.10/d_net.c.o \
    CMakeFiles/wasm-doom.dir/src/DOOM/linuxdoom-1.10/debug.c.o \
    CMakeFiles/wasm-doom.dir/src/DOOM/linuxdoom-1.10/doomdef.c.o \
    CMakeFiles/wasm-doom.dir/src/DOOM/linuxdoom-1.10/doomstat.c.o \
    CMakeFiles/wasm-doom.dir/src/DOOM/linuxdoom-1.10/dstrings.c.o \
    CMakeFiles/wasm-doom.dir/src/DOOM/linuxdoom-1.10/f_finale.c.o \
    CMakeFiles/wasm-doom.dir/src/DOOM/linuxdoom-1.10/f_wipe.c.o \
    CMakeFiles/wasm-doom.dir/src/DOOM/linuxdoom-1.10/g_game.c.o \
    CMakeFiles/wasm-doom.dir/src/DOOM/linuxdoom-1.10/hu_lib.c.o \
    CMakeFiles/wasm-doom.dir/src/DOOM/linuxdoom-1.10/hu_stuff.c.o \
    CMakeFiles/wasm-doom.dir/src/DOOM/linuxdoom-1.10/i_main.c.o \
    CMakeFiles/wasm-doom.dir/src/DOOM/linuxdoom-1.10/i_net.c.o \
    CMakeFiles/wasm-doom.dir/src/DOOM/linuxdoom-1.10/i_sound.c.o \
    CMakeFiles/wasm-doom.dir/src/DOOM/linuxdoom-1.10/i_system.c.o \
    CMakeFiles/wasm-doom.dir/src/DOOM/linuxdoom-1.10/i_video.c.o \
    CMakeFiles/wasm-doom.dir/src/DOOM/linuxdoom-1.10/info.c.o \
    CMakeFiles/wasm-doom.dir/src/DOOM/linuxdoom-1.10/m_argv.c.o \
    CMakeFiles/wasm-doom.dir/src/DOOM/linuxdoom-1.10/m_bbox.c.o \
    CMakeFiles/wasm-doom.dir/src/DOOM/linuxdoom-1.10/m_cheat.c.o \
    CMakeFiles/wasm-doom.dir/src/DOOM/linuxdoom-1.10/m_fixed.c.o \
    CMakeFiles/wasm-doom.dir/src/DOOM/linuxdoom-1.10/m_menu.c.o \
    CMakeFiles/wasm-doom.dir/src/DOOM/linuxdoom-1.10/m_misc.c.o \
    CMakeFiles/wasm-doom.dir/src/DOOM/linuxdoom-1.10/m_random.c.o \
    CMakeFiles/wasm-doom.dir/src/DOOM/linuxdoom-1.10/m_swap.c.o \
    CMakeFiles/wasm-doom.dir/src/DOOM/linuxdoom-1.10/p_ceilng.c.o \
    CMakeFiles/wasm-doom.dir/src/DOOM/linuxdoom-1.10/p_doors.c.o \
    CMakeFiles/wasm-doom.dir/src/DOOM/linuxdoom-1.10/p_enemy.c.o \
    CMakeFiles/wasm-doom.dir/src/DOOM/linuxdoom-1.10/p_floor.c.o \
    CMakeFiles/wasm-doom.dir/src/DOOM/linuxdoom-1.10/p_inter.c.o \
    CMakeFiles/wasm-doom.dir/src/DOOM/linuxdoom-1.10/p_lights.c.o \
    CMakeFiles/wasm-doom.dir/src/DOOM/linuxdoom-1.10/p_map.c.o \
    CMakeFiles/wasm-doom.dir/src/DOOM/linuxdoom-1.10/p_maputl.c.o \
    CMakeFiles/wasm-doom.dir/src/DOOM/linuxdoom-1.10/p_mobj.c.o \
    CMakeFiles/wasm-doom.dir/src/DOOM/linuxdoom-1.10/p_plats.c.o \
    CMakeFiles/wasm-doom.dir/src/DOOM/linuxdoom-1.10/p_pspr.c.o \
    CMakeFiles/wasm-doom.dir/src/DOOM/linuxdoom-1.10/p_saveg.c.o \
    CMakeFiles/wasm-doom.dir/src/DOOM/linuxdoom-1.10/p_setup.c.o \
    CMakeFiles/wasm-doom.dir/src/DOOM/linuxdoom-1.10/p_sight.c.o \
    CMakeFiles/wasm-doom.dir/src/DOOM/linuxdoom-1.10/p_spec.c.o \
    CMakeFiles/wasm-doom.dir/src/DOOM/linuxdoom-1.10/p_switch.c.o \
    CMakeFiles/wasm-doom.dir/src/DOOM/linuxdoom-1.10/p_telept.c.o \
    CMakeFiles/wasm-doom.dir/src/DOOM/linuxdoom-1.10/p_tick.c.o \
    CMakeFiles/wasm-doom.dir/src/DOOM/linuxdoom-1.10/p_user.c.o \
    CMakeFiles/wasm-doom.dir/src/DOOM/linuxdoom-1.10/palette.c.o \
    CMakeFiles/wasm-doom.dir/src/DOOM/linuxdoom-1.10/pcx.c.o \
    CMakeFiles/wasm-doom.dir/src/DOOM/linuxdoom-1.10/r_bsp.c.o \
    CMakeFiles/wasm-doom.dir/src/DOOM/linuxdoom-1.10/r_data.c.o \
    CMakeFiles/wasm-doom.dir/src/DOOM/linuxdoom-1.10/r_draw.c.o \
    CMakeFiles/wasm-doom.dir/src/DOOM/linuxdoom-1.10/r_main.c.o \
    CMakeFiles/wasm-doom.dir/src/DOOM/linuxdoom-1.10/r_plane.c.o \
    CMakeFiles/wasm-doom.dir/src/DOOM/linuxdoom-1.10/r_segs.c.o \
    CMakeFiles/wasm-doom.dir/src/DOOM/linuxdoom-1.10/r_sky.c.o \
    CMakeFiles/wasm-doom.dir/src/DOOM/linuxdoom-1.10/r_things.c.o \
    CMakeFiles/wasm-doom.dir/src/DOOM/linuxdoom-1.10/s_sound.c.o \
    CMakeFiles/wasm-doom.dir/src/DOOM/linuxdoom-1.10/sounds.c.o \
    CMakeFiles/wasm-doom.dir/src/DOOM/linuxdoom-1.10/st_lib.c.o \
    CMakeFiles/wasm-doom.dir/src/DOOM/linuxdoom-1.10/st_stuff.c.o \
    CMakeFiles/wasm-doom.dir/src/DOOM/linuxdoom-1.10/tables.c.o \
    CMakeFiles/wasm-doom.dir/src/DOOM/linuxdoom-1.10/v_video.c.o \
    CMakeFiles/wasm-doom.dir/src/DOOM/linuxdoom-1.10/w_wad.c.o \
    CMakeFiles/wasm-doom.dir/src/DOOM/linuxdoom-1.10/wi_stuff.c.o \
    CMakeFiles/wasm-doom.dir/src/DOOM/linuxdoom-1.10/xlib_hack.c.o \
    CMakeFiles/wasm-doom.dir/src/DOOM/linuxdoom-1.10/z_zone.c.o \
    --pre-js src/pre.js \
    -s MODULARIZE=1 \
    -s ALLOW_MEMORY_GROWTH=1 \
    -s ERROR_ON_UNDEFINED_SYMBOLS=0 \
    -s EXPORT_NAME='WasmDoom'\
    -s ASYNCIFY=1 \
    -s FORCE_FILESYSTEM=1 \
    -o ${JS_FILENAME}


gsed -i.old '1s;^;\/* eslint-disable */\n&;' ${JS_FILENAME}
gsed -i.old '2s;^;\// @ts-ignore;' ${JS_FILENAME}
gsed -i.old "s|$WASM_FILENAME|/$WASM_FILENAME|" ${JS_FILENAME}
gsed -i.old "s|wasmBinaryFile = locateFile|// wasmBinaryFile = locateFile|" ${JS_FILENAME}
mv react-wasm/src/wasm/${WASM_FILENAME} react-wasm/public/${WASM_FILENAME}
cp ./doom1.wad react-wasm/public/doom1.wad

