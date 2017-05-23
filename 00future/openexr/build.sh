#!/bin/bash

cd IlmBase
mkdir -p build && cd build
cmake -DCMAKE_BUILD_TYPE=Release \
      -DCMAKE_PREFIX_PATH=$PREFIX \
      -DCMAKE_INSTALL_PREFIX=$PREFIX \
      -DBUILD_SHARED_LIBS=ON \
      ..

[ $? -ne 0 ] && exit 1
cmake --build .
[ $? -ne 0 ] && exit 1
cmake --build . --target install

cd $SRC_DIR
cd OpenEXR
mkdir -p build && cd build
cmake -DCMAKE_BUILD_TYPE=Release \
      -DCMAKE_PREFIX_PATH=$PREFIX \
      -DCMAKE_INSTALL_PREFIX=$PREFIX \
      -DBUILD_SHARED_LIBS=ON \
      -DILMBASE_PACKAGE_PREFIX=$PREFIX \
      ..

[ $? -ne 0 ] && exit 1
cmake --build .
[ $? -ne 0 ] && exit 1
cmake --build . --target install