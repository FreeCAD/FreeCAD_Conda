mkdir -p build
cd build

#  for local debugging
# -D CMAKE_C_COMPILER=/usr/bin/gcc \
# -D CMAKE_CXX_COMPILER=/usr/bin/g++ \

cmake -D CMAKE_BUILD_TYPE=Release \
      -D PTHREAD_INCLUDE_DIRS=${PREFIX} \
      -D ENABLE_SMESH=ON \
      -D ENABLE_NETGEN=ON \
      -D ENABLE_BLSURF=OFF \
      ..

# make -j${CPU_COUNT}
make -j${CPU_COUNT} install

cd ..
${PYTHON} setup.py install