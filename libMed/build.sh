mkdir build -p
cd build 

cmake -G "Ninja"  \
      -DCMAKE_INSTALL_PREFIX=$PREFIX \
      -DINSTALL_DIR=$PREFIX \
      -DMEDFILE_INSTALL_DOC=OFF \
      -DCMAKE_BUILD_TYPE=Release \
      ..

ninja install

rm -r $PREFIX/share/doc