mkdir -p build
cd build

cmake -G "Ninja" \
      -D CMAKE_INSTALL_PREFIX=$PREFIX \
      -D CMAKE_BUILD_TYPE=Release \
      -D BUILD_PYTHON=ON \
      ..

ninja _slvs -v
cp src/swig/python/_slvs.so ${SP_DIR}