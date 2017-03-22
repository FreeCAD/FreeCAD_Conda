cmake -DCMAKE_INSTALL_PREFIX=$PREFIX \
      -DINSTALL_DIR=$PREFIX \
      -DMEDFILE_INSTALL_DOC=OFF \
      .
make -j4
make install
