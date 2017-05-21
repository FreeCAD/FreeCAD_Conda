cmake -DCMAKE_INSTALL_PREFIX=$PREFIX \
      -DCMAKE_PREFIX_PATH=$PREFIX \
      -DCMAKE_INSTALL_LIBDIR=$PREFIX/lib \
      -DCMAKE_BUILD_TYPE="Release" \
      -DUSE_QT5=OFF \
      ../../../../git/soqt

make -j4 install