mkdir build && cd build
cmake -DCMAKE_INSTALL_PREFIX=$PREFIX \
      -DCMAKE_PREFIX_PATH=$PREFIX \
      ..

make -j${CPU_COUNT} install