cmake_minimum_required(VERSION 2.8.12.2)
project(terminal-doom C)
set(CMAKE_BUILD_TYPE Debug)

set(CMAKE_C_STANDARD 11)

include_directories(src/DOOM/linuxdoom-1.10)

#-g -Wall -DNORMALUNIX -DMACOS # -DUSEASM
SET(DEBUG -g)
SET(WALL -Wall)
SET(NORMALUNIX -DNORMALUNIX)
SET(MACOS -DMACOS)
SET(FLAG32 -m32)
SET(CMAKE_C_FLAGS "-m32")
SET(NO_CURSES -DNO_CURSES)
SET(NO_COLORS -DNO_COLORS)
SET(NO_DEBUG -DNO_DEBUG)
SET(CMAKE_C_FLAGS_DEBUG "-D_DEBUG")

SET(CMAKE_C_FLAGS "-s ERROR_ON_UNDEFINED_SYMBOLS=0")
SET(CMAKE_SHARED_LINKER_FLAGS "-s ERROR_ON_UNDEFINED_SYMBOLS=0")

if(UNIX AND NOT APPLE)
    SET(LINUX -DLINUX)
endif()

add_definitions(${DEBUG} ${WALL} ${NORMALUNIX} ${MACOS} ${FLAGS32} ${NO_DEBUG} ${NO_COLORS} ${NO_CURSES})

add_executable(wasm-doom
        src/DOOM/linuxdoom-1.10/am_map.c
        src/DOOM/linuxdoom-1.10/am_map.h
        src/DOOM/linuxdoom-1.10/d_englsh.h
        src/DOOM/linuxdoom-1.10/d_event.h
        src/DOOM/linuxdoom-1.10/d_french.h
        src/DOOM/linuxdoom-1.10/d_items.c
        src/DOOM/linuxdoom-1.10/d_items.h
        src/DOOM/linuxdoom-1.10/d_main.c
        src/DOOM/linuxdoom-1.10/d_main.h
        src/DOOM/linuxdoom-1.10/d_net.c
        src/DOOM/linuxdoom-1.10/d_net.h
        src/DOOM/linuxdoom-1.10/d_player.h
        src/DOOM/linuxdoom-1.10/d_textur.h
        src/DOOM/linuxdoom-1.10/d_think.h
        src/DOOM/linuxdoom-1.10/d_ticcmd.h
        src/DOOM/linuxdoom-1.10/doomdata.h
        src/DOOM/linuxdoom-1.10/doomdef.c
        src/DOOM/linuxdoom-1.10/doomdef.h
        src/DOOM/linuxdoom-1.10/doomstat.c
        src/DOOM/linuxdoom-1.10/doomstat.h
        src/DOOM/linuxdoom-1.10/doomtype.h
        src/DOOM/linuxdoom-1.10/dstrings.c
        src/DOOM/linuxdoom-1.10/dstrings.h
        src/DOOM/linuxdoom-1.10/f_finale.c
        src/DOOM/linuxdoom-1.10/f_finale.h
        src/DOOM/linuxdoom-1.10/f_wipe.c
        src/DOOM/linuxdoom-1.10/f_wipe.h
        src/DOOM/linuxdoom-1.10/g_game.c
        src/DOOM/linuxdoom-1.10/g_game.h
        src/DOOM/linuxdoom-1.10/hu_lib.c
        src/DOOM/linuxdoom-1.10/hu_lib.h
        src/DOOM/linuxdoom-1.10/hu_stuff.c
        src/DOOM/linuxdoom-1.10/hu_stuff.h
        src/DOOM/linuxdoom-1.10/i_main.c
        src/DOOM/linuxdoom-1.10/i_net.c
        src/DOOM/linuxdoom-1.10/i_net.h
        src/DOOM/linuxdoom-1.10/i_sound.c
        src/DOOM/linuxdoom-1.10/i_sound.h
        src/DOOM/linuxdoom-1.10/i_system.c
        src/DOOM/linuxdoom-1.10/i_system.h
        src/DOOM/linuxdoom-1.10/i_video.c
        src/DOOM/linuxdoom-1.10/i_video.h
        src/DOOM/linuxdoom-1.10/info.c
        src/DOOM/linuxdoom-1.10/info.h
        src/DOOM/linuxdoom-1.10/m_argv.c
        src/DOOM/linuxdoom-1.10/m_argv.h
        src/DOOM/linuxdoom-1.10/m_bbox.c
        src/DOOM/linuxdoom-1.10/m_bbox.h
        src/DOOM/linuxdoom-1.10/m_cheat.c
        src/DOOM/linuxdoom-1.10/m_cheat.h
        src/DOOM/linuxdoom-1.10/m_fixed.c
        src/DOOM/linuxdoom-1.10/m_fixed.h
        src/DOOM/linuxdoom-1.10/m_menu.c
        src/DOOM/linuxdoom-1.10/m_menu.h
        src/DOOM/linuxdoom-1.10/m_misc.c
        src/DOOM/linuxdoom-1.10/m_misc.h
        src/DOOM/linuxdoom-1.10/m_random.c
        src/DOOM/linuxdoom-1.10/m_random.h
        src/DOOM/linuxdoom-1.10/m_swap.c
        src/DOOM/linuxdoom-1.10/m_swap.h
        src/DOOM/linuxdoom-1.10/p_ceilng.c
        src/DOOM/linuxdoom-1.10/p_doors.c
        src/DOOM/linuxdoom-1.10/p_enemy.c
        src/DOOM/linuxdoom-1.10/p_floor.c
        src/DOOM/linuxdoom-1.10/p_inter.c
        src/DOOM/linuxdoom-1.10/p_inter.h
        src/DOOM/linuxdoom-1.10/p_lights.c
        src/DOOM/linuxdoom-1.10/p_local.h
        src/DOOM/linuxdoom-1.10/p_map.c
        src/DOOM/linuxdoom-1.10/p_maputl.c
        src/DOOM/linuxdoom-1.10/p_mobj.c
        src/DOOM/linuxdoom-1.10/p_mobj.h
        src/DOOM/linuxdoom-1.10/p_plats.c
        src/DOOM/linuxdoom-1.10/p_pspr.c
        src/DOOM/linuxdoom-1.10/p_pspr.h
        src/DOOM/linuxdoom-1.10/p_saveg.c
        src/DOOM/linuxdoom-1.10/p_saveg.h
        src/DOOM/linuxdoom-1.10/p_setup.c
        src/DOOM/linuxdoom-1.10/p_setup.h
        src/DOOM/linuxdoom-1.10/p_sight.c
        src/DOOM/linuxdoom-1.10/p_spec.c
        src/DOOM/linuxdoom-1.10/p_spec.h
        src/DOOM/linuxdoom-1.10/p_switch.c
        src/DOOM/linuxdoom-1.10/p_telept.c
        src/DOOM/linuxdoom-1.10/p_tick.c
        src/DOOM/linuxdoom-1.10/p_tick.h
        src/DOOM/linuxdoom-1.10/p_user.c
        src/DOOM/linuxdoom-1.10/r_bsp.c
        src/DOOM/linuxdoom-1.10/r_bsp.h
        src/DOOM/linuxdoom-1.10/r_data.c
        src/DOOM/linuxdoom-1.10/r_data.h
        src/DOOM/linuxdoom-1.10/r_defs.h
        src/DOOM/linuxdoom-1.10/r_draw.c
        src/DOOM/linuxdoom-1.10/r_draw.h
        src/DOOM/linuxdoom-1.10/r_local.h
        src/DOOM/linuxdoom-1.10/r_main.c
        src/DOOM/linuxdoom-1.10/r_main.h
        src/DOOM/linuxdoom-1.10/r_plane.c
        src/DOOM/linuxdoom-1.10/r_plane.h
        src/DOOM/linuxdoom-1.10/r_segs.c
        src/DOOM/linuxdoom-1.10/r_segs.h
        src/DOOM/linuxdoom-1.10/r_sky.c
        src/DOOM/linuxdoom-1.10/r_sky.h
        src/DOOM/linuxdoom-1.10/r_state.h
        src/DOOM/linuxdoom-1.10/r_things.c
        src/DOOM/linuxdoom-1.10/r_things.h
        src/DOOM/linuxdoom-1.10/s_sound.c
        src/DOOM/linuxdoom-1.10/s_sound.h
        src/DOOM/linuxdoom-1.10/sounds.c
        src/DOOM/linuxdoom-1.10/sounds.h
        src/DOOM/linuxdoom-1.10/st_lib.c
        src/DOOM/linuxdoom-1.10/st_lib.h
        src/DOOM/linuxdoom-1.10/st_stuff.c
        src/DOOM/linuxdoom-1.10/st_stuff.h
        src/DOOM/linuxdoom-1.10/tables.c
        src/DOOM/linuxdoom-1.10/tables.h
        src/DOOM/linuxdoom-1.10/v_video.c
        src/DOOM/linuxdoom-1.10/v_video.h
        src/DOOM/linuxdoom-1.10/values.h
        src/DOOM/linuxdoom-1.10/w_wad.c
        src/DOOM/linuxdoom-1.10/w_wad.h
        src/DOOM/linuxdoom-1.10/wi_stuff.c
        src/DOOM/linuxdoom-1.10/wi_stuff.h
        src/DOOM/linuxdoom-1.10/xlib_hack.c
        src/DOOM/linuxdoom-1.10/xlib_hack.h
        src/DOOM/linuxdoom-1.10/z_zone.c
        src/DOOM/linuxdoom-1.10/z_zone.h
        src/DOOM/linuxdoom-1.10/pcx.c
        src/DOOM/linuxdoom-1.10/pcx.h
        src/DOOM/linuxdoom-1.10/bitmap.c
        src/DOOM/linuxdoom-1.10/bitmap.h
        src/DOOM/linuxdoom-1.10/palette.h
        src/DOOM/linuxdoom-1.10/palette.c
        src/DOOM/linuxdoom-1.10/pixel.h
        src/DOOM/linuxdoom-1.10/color.c
        src/DOOM/linuxdoom-1.10/color.h
        src/DOOM/linuxdoom-1.10/debug.c
        src/DOOM/linuxdoom-1.10/debug.h
        )
target_link_libraries(wasm-doom m)

configure_file(
        ${CMAKE_CURRENT_SOURCE_DIR}/doom1.wad
        ${CMAKE_CURRENT_BINARY_DIR}/doom1.wad
        COPYONLY
)
#[[configure_file(
        "${CMAKE_CURRENT_SOURCE_DIR}/DOOM1 2.WAD"
        "${CMAKE_CURRENT_BINARY_DIR}/DOOM1 2.WAD"
        COPYONLY
)]]


# target_link_libraries(terminal-doom /Volumes/Xcode/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.11.sdk/usr/lib/libcurses.tbd)
