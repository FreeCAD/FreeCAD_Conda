FREECAD_SOURCE=~/projects/FreeCAD # this is the path to the FreeCAD source (modyfy to your needs)


cmake -DCMAKE_BUILD_TYPE=Release \
      -DCMAKE_INSTALL_PREFIX=$PREFIX/lib/freecad \
      -DCMAKE_PREFIX_PATH=$PREFIX \
      -DCMAKE_C_COMPILER=/usr/bin/gcc-4.9 \
      -DCMAKE_CXX_COMPILER=/usr/bin/g++-4.9 \
      -DBUILD_QT5=ON \
      -DNETGENDATA=$PREFIX/include/netgen \
      -DNETGEN_INCLUDEDIR=$PREFIX/include/netgen \
      -DNGLIB_INCLUDE_DIR=$PREFIX/include/nglib \
      -DOCC_INCLUDE_DIR=$PREFIX/include/opencascade \
      -DOCC_LIBRARY_DIR=$PREFIX/lib \
      -DOCC_LIBRARIES=$PREFIX/lib CACHE PATH \
      -DFREECAD_USE_OCC_VARIANT="Official Version" \
      -DOCC_OCAF_LIBRARIES=$PREFIX/lib CACHE PATH \
      -DSWIG_DIR=$PREFIX/share/swig/3.0.8 \
      -DSWIG_EXECUTABLE=$PREFIX/bin/swig \
      -DPYTHON_EXECUTABLE=$PYTHON \
      -DBUILD_FEM_NETGEN=YES \
      -DUSE_BOOST_PYTHON=NO \
      ${FREECAD_SOURCE}

make -j-j${CPU_COUNT} 2>&1 | tee output.txt
make install
rm ${PREFIX}/doc -r     # smaller size of package!
mkdir -p $PREFIX/bin/
ln -s $PREFIX/lib/freecad/bin/FreeCAD $PREFIX/bin/freecad
ln -s $PREFIX/lib/freecad/bin/FreeCADCmd $PREFIX/bin/freecad_cmd