cmake -DCMAKE_INSTALL_PREFIX=$PREFIX \
      -DINSTALL_DIR=$PREFIX \
      .
make -j4
make install
