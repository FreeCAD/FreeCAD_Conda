mkdir -p build
cd build

cmake -D CMAKE_BUILD_TYPE=Release \
	  -D CMAKE_INSTALL_PREFIX=${PREFIX} \
      -D CMAKE_PREFIX_PATH=${PREFIX} \
      -D CMAKE_SYSTEM_PREFIX_PATH=${PREFIX} \
      -D ENABLE_SMESH=OFF \
      -D ENABLE_NETGEN=OFF \
      -D ENABLE_BLSURF=OFF \
      ~/projects/pyOCCT

make install