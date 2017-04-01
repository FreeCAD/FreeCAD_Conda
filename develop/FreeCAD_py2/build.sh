FREECAD_SOURCE=~/projects/FreeCAD # this is the path to the FreeCAD source (modyfy to your needs)
BUILD_FULL=true                  # run cmake .. if true, if not use the --dirty flag of conda (maybe this can be automated)


if [ "$BUILD_FULL" = true ] ; then
    cmake -DCMAKE_BUILD_TYPE=Release \
          -DCMAKE_INSTALL_PREFIX=$PREFIX \
          -DCMAKE_PREFIX_PATH=$PREFIX \
          -DCMAKE_C_COMPILER=/usr/bin/gcc-4.9 \
          -DCMAKE_CXX_COMPILER=/usr/bin/g++-4.9 \
          -DNETGENDATA=$PREFIX/include/netgen \
          -DNETGEN_INCLUDEDIR=$PREFIX/include/netgen \
          -DNGLIB_INCLUDE_DIR=$PREFIX/include/netgen/nglib \
          -DOCC_INCLUDE_DIR=$PREFIX/include/opencascade \
          -DOCC_LIBRARY_DIR=$PREFIX/lib \
          -DOCC_LIBRARIES=$PREFIX/lib CACHE PATH \
          -DFREECAD_USE_OCC_VARIANT="Official Version" \
          -DOCC_OCAF_LIBRARIES=$PREFIX/lib CACHE PATH \
          -DSWIG_DIR=$PREFIX/share/swig/3.0.8 \
          -DSWIG_EXECUTABLE=$PREFIX/bin/swig \
          -DPYTHON_EXECUTABLE=$PYTHON \
          -DBUILD_FEM_NETGEN=ON \
          -DBUILD_PATH=NO \
          ${FREECAD_SOURCE}
fi

make -j4 2>&1 | tee output.txt
make install -j4
rm ${PREFIX}/doc -r     # smaller size of package!
