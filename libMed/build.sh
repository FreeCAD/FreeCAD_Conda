mkdir build -p
cd build 

cmake -DCMAKE_INSTALL_PREFIX=$PREFIX \
      -DINSTALL_DIR=$PREFIX \
      -DMEDFILE_INSTALL_DOC=OFF \
      -DCMAKE_BUILD_TYPE=Release \
      ..

make -j-j${CPU_COUNT}
make install

rm -r $PREFIX/share/doc