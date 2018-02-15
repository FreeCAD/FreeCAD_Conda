#!/bin/bash

set -e

# export LDFLAGS="-L$PREFIX/lib"
# export CPPFLAGS="-I$PREFIX/include"

(cd unix && ./prebuild.sh)

./configure \
    --prefix="$PREFIX" \
    --with-boost="$PREFIX" \
    --with-boost-thread=boost_thread \
    --without-x \
    --without-openexr \
    --without-libsdl \
    COMPILED_BY="conda"

make
make install
