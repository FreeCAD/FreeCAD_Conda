#!/bin/bash

mkdir build
cd build
cmake \
    -DCMAKE_INSTALL_PREFIX=$PREFIX \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_RPATH=$LD_RUN_PATH \
    -DPYTHON_EXECUTABLE=$PYTHON \
    -DLIB_INSTALL_DIR=$PREFIX/lib \
    -DShiboken_DIR=$PREFIX \
    -DUSE_PYTHON_VERSION=$(expr $CONDA_PY / 10) \
    ..
make
make install
