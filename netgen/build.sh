echo "-------------------CUSTOM VARIABLES-------------"
export NETGENDIR=$PREFIX/lib/netgen
echo "set NETGENDIR to: $NETGENDIR"

export PYTHONPATH=$SP_DIR
echo "set PYTHONPATH to: $PYTHONPATH"
echo "------------------------------------------------"

cmake -DCMAKE_INSTALL_PREFIX=$PREFIX \
      -DINSTALL_DIR=$PREFIX \
      -DUSE_OCC=ON \
      -DOCC_INCLUDE_DIR=$PREFIX/include/opencascade \
      -OCC_LIBRARY_DIR=$PREFIX/lib \
      -DUSE_PYTHON=OFF \
      .
make -j4 > output.txt
make install 

mkdir ${PREFIX}/include/netgen


rsync -avm --include='*.h*' -f 'hide,! */' . ${PREFIX}/include/netgen
# cp -rf ${SRC_DIR}/nglib/*.h ${PREFIX}/include/netgen
# cp -rf ${SRC_DIR}/libsrc/include/*.hpp ${PREFIX}/include/netgen
# cp -rf ${SRC_DIR}/libsrc/general/*.hpp ${PREFIX}/include/netgen
# cp -rf ${SRC_DIR}/libsrc/gprim/*.hpp ${PREFIX}/include/netgen
# cp -rf ${SRC_DIR}/libsrc/geom2d/*.hpp ${PREFIX}/include/netgen
# cp -rf ${SRC_DIR}/libsrc/geom2d/*.hpp ${PREFIX}/include/netgen
