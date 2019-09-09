mkdir -p build
cd build

cmake -G "Ninja" \
      -D CMAKE_INSTALL_PREFIX=$PREFIX \
      -D CMAKE_BUILD_TYPE:STRING=Release \
      -D BUILD_PYTHON:BOOL=ON \
      -D ENABLE_GUI:BOOL=OFF \
      ..

ninja _slvs -v -w dupbuild=warn

cp src/swig/python/_slvs.so ${SP_DIR}
cp src/swig/python/slvs.py ${SP_DIR}