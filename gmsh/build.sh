#!/bin/sh

mkdir build
cd build

# build.
cmake -G "Ninja" \
      -D CMAKE_INSTALL_PREFIX=$PREFIX \
      -D ENABLE_OS_SPECIFIC_INSTALL=OFF \
      -D ENABLE_MATCH=OFF \
      -D ENABLE_PETSC=ON \
      -D ENABLE_SLEPC=ON \
      -D ENABLE_OCC=ON \
      -D ENABLE_MPI=ON \
      ..

ninja install