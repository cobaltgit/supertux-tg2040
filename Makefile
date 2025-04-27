APP_NAME = supertux

CXX := arm-linux-g++
SYSROOT = $(shell $(CXX) -print-sysroot)

CXXDEFS = -DTRIMUISMART -DRES320X240 -DNOOPENGL -DHAVE_SOUND
CXXFLAGS = $(CXXDEFS) -Wall -O3 -march=armv7-a -mtune=cortex-a7 -mfpu=neon-vfpv4 -mfloat-abi=hard -std=gnu++03 `$(SYSROOT)/usr/bin/sdl-config --cflags`
CXXLIBS = -s -lz -lm -lSDL -lSDL_mixer -lSDL_image

# source files

OBJ =	src/badguy.o \
	src/bitmask.o \
	src/button.o \
	src/collision.o \
	src/configfile.o \
	src/intro.o \
	src/gameloop.o \
	src/globals.o \
	src/high_scores.o \
	src/level.o \
	src/leveleditor.o \
	src/lispreader.o \
	src/menu.o \
	src/particlesystem.o \
	src/physic.o \
	src/player.o \
	src/scene.o \
	src/screen.o \
	src/setup.o \
	src/special.o \
	src/supertux.o \
	src/text.o \
	src/texture.o \
	src/timer.o \
	src/title.o \
	src/type.o \
	src/world.o \
	src/worldmap.o \
	src/tile.o \
	src/mousecursor.o \
	src/resources.o \
	src/gameobjs.o \
	src/sprite.o \
	src/sprite_manager.o \
	src/music_manager.o \
	src/musicref.o \
	src/sound.o

all : $(APP_NAME)

$(APP_NAME) : $(OBJ)
	$(CXX) $^ $(CXXLIBS) -o $@

%.o : %.cpp
	$(CXX) -c $(CXXFLAGS) $< -o $@

clean :
	rm -rf src/*.o $(APP_NAME)
