mkdir -p build
cd build

cmake \
      -D CMAKE_INSTALL_PREFIX=$PREFIX \
      -D CMAKE_BUILD_TYPE=Release \
      -D BUILD_PYTHON=ON \
      ..

make _slvs
cp src/swig/python/_slvs.so $SP_DIR