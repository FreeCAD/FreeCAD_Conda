echo "-------------------CUSTOM VARIABLES-------------"
export NETGENDIR=$PREFIX/lib/netgen
echo "set NETGENDIR to: $NETGENDIR"

export PYTHONPATH=$SP_DIR
echo "set PYTHONPATH to: $PYTHONPATH"
echo "------------------------------------------------"

mkdir build -p
cd build 

cmake -DCMAKE_BUILD_TYPE=Release \
      -DCMAKE_INSTALL_PREFIX=$PREFIX \
      -DINSTALL_DIR=$PREFIX \
      -DUSE_OCC=ON \
      -DUSE_PYTHON=OFF \
      -DUSE_GUI=OFF \
      -DOCC_INCLUDE_DIR=$PREFIX/include/opencascade \
      -DOCC_LIBRARY_DIR=$PREFIX/lib \
      -DPYBIND_INCLUDE_DIRS=$PREFIX/include/python3.5 \
      ..

make -j5 2>&1 | tee output.txt
make install 

mkdir ${PREFIX}/include/netgen

rsync -avm --include='*.h*' -f 'hide,! */' .. ${PREFIX}/include/netgen
cp ${PREFIX}/include/netgen/build/netgen/config.h ${PREFIX}/include/netgen/mydefs.hpp
rm ${PREFIX}/include/netgen/build -r