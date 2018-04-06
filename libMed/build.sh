mkdir build -p
cd build 

cmake -G "Ninja"  \
      -D CMAKE_BUILD_TYPE=Release \
      -D CMAKE_INSTALL_PREFIX=$PREFIX \
      -D INSTALL_DIR=$PREFIX \
      -D MEDFILE_INSTALL_DOC=OFF \
      ..

ninja install