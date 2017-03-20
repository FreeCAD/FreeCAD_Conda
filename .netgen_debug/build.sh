NETGEN_SOURCE=~/projects/netgen   # this is the path to the FreeCAD source (modyfy to your needs)
BUILD_FULL=true                     # run cmake .. if true, if not use the --dirty flag of conda (maybe this can be automated)

echo "-------------------CUSTOM VARIABLES-------------"
export NETGENDIR=$PREFIX/lib/netgen
echo "set NETGENDIR to: $NETGENDIR"

export PYTHONPATH=$SP_DIR
echo "set PYTHONPATH to: $PYTHONPATH"
echo "------------------------------------------------"

if [ "$BUILD_FULL" = true ] ; then
    mkdir -p build
    cd build 

    cmake -DCMAKE_BUILD_TYPE=Release \
          -DCMAKE_INSTALL_PREFIX=$PREFIX \
          -DINSTALL_DIR=$PREFIX \
          -DUSE_OCC=ON \
          -DUSE_PYTHON=OFF \
          -DUSE_GUI=OFF \
          -DUSE_SUPERBUILD=OFF \
          -DOCC_INCLUDE_DIR=$PREFIX/include/opencascade \
          -DOCC_LIBRARY_DIR=$PREFIX/lib \
          -DPYBIND_INCLUDE_DIR=$PREFIX/include/pybind11 \
           ${NETGEN_SOURCE}
fi

make -j5 2>&1 | tee output.txt
make install 

mkdir ${PREFIX}/include/netgen

rsync -avm --include='*.h*' -f 'hide,! */' .. ${PREFIX}/include/netgen
cp ${PREFIX}/include/netgen/build/config.h ${PREFIX}/include/netgen/mydefs.hpp
rm ${PREFIX}/include/netgen/build -r