mkdir -p build
cd build

# cmake -DCMAKE_INSTALL_PREFIX=$PREFIX \
#       -DCMAKE_PREFIX_PATH=$PREFIX \
#       -DCMAKE_INSTALL_LIBDIR=$PREFIX/lib \
#       -DCMAKE_BUILD_TYPE="Release" \
#       -DUSE_QT5=OFF \
#       ..

../configure \
	--prefix=$PREFIX \
	--exec_prefix=$PREFIX

make -j4 install