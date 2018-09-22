mkdir build -p
cd build 

cmake -DCMAKE_BUILD_TYPE=Release \
      -DCMAKE_PREFIX_PATH=$PREFIX \
      -DCMAKE_INSTALL_PREFIX=$PREFIX \
      ..

make -j${CPU_COUNT} 2>&1 | tee output.txt
make -j${CPU_COUNT} install 