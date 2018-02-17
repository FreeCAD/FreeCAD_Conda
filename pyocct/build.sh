mkdir -p build
cd build

cmake -D CMAKE_BUILD_TYPE=Release \
      -D CMAKE_C_COMPILER=/usr/bin/gcc \
      -D CMAKE_CXX_COMPILER=/usr/bin/g++ \
      -D PTHREAD_INCLUDE_DIRS=${PREFIX} \
      -D ENABLE_SMESH=ON \
      -D ENABLE_NETGEN=ON \
      -D ENABLE_BLSURF=OFF \
      ~/projects/pyOCCT

make -j${CPU_COUNT}

cd ~/projects/pyOCCT
${PYTHON} setup.py install