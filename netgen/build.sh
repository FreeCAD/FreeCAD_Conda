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
      -DINCDIR=$PREFIX/include/netgen \
      -DOCC_INCLUDE_DIR=$PREFIX/include/opencascade \
      -DOCC_LIBRARY_DIR=$PREFIX/lib \
      -DUSE_OCC=ON \
      -DUSE_PYTHON=ON \
      -DUSE_GUI=OFF \
      -DUSE_SUPERBUILD=OFF \
      ..

make -j4 2>&1 | tee output.txt
make install 

mkdir ${PREFIX}/include/netgen -p
# this line is not correct. There is already a mydef.hpp in the include files
# better just move the config.h and make FreeCAD-cmake look for a congfig.h instead of 
# a mydefs.hpp
cp ${SRC_DIR}/build/config.h ${PREFIX}/include/netgen/mydefs.hpp