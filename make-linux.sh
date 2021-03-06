#!/bin/bash

rm release/other/ft2-clone &> /dev/null
echo Compiling, please wait patiently...

# If you're compiling for *SLOW* devices, try adding -DLERPMIX right after gcc
# This will activate 2-tap linear interpolation mixing (blurrier sound) instead
# of 3-tap quadratic interpolation mixing (sharper sound)

gcc -DNDEBUG -DHAS_MIDI -D__LINUX_ALSA__ src/rtmidi/*.cpp src/gfxdata/*.c src/*.c -lSDL2 -lpthread -lasound -lstdc++ -lm -Wshadow -Winit-self -Wall -Wno-missing-field-initializers -Wno-unused-result -Wno-strict-aliasing -Wextra -Wunused -Wunreachable-code -Wswitch-default -march=native -mtune=native -O3 -o release/other/ft2-clone

rm src/rtmidi/*.o src/gfxdata/*.o src/*.o &> /dev/null

echo Done. The executable can be found in \'release/other\' if everything went well.
