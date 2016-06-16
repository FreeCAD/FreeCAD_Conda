#!/bin/bash
mkdir build
cd build

cmake .. -G"Unix Makefiles" \
-DCMAKE_BUILD_TYPE=Release \
-DCMAKE_INSTALL_PREFIX=$PREFIX

make
make install
