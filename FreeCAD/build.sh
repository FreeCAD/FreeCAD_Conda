mkdir $PREFIX/lib/freecad -p


cmake -DCMAKE_BUILD_TYPE=Release \
      -DCMAKE_INSTALL_PREFIX=$PREFIX \
      -DCMAKE_PREFIX_PATH=$PREFIX \
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
      -DBUILD_FEM_NETGEN=YES \
      -DBUILD_ARCH=YES \
      -DBUILD_ASSEMBLY=NO \
      -DBUILD_COMPLETE=YES \
      -DBUILD_DRAFT=YES \
      -DBUILD_DRAWING=YES \
      -DBUILD_FEM=YES \
      -DBUILD_GUI=YES \
      -DBUILD_IDF=YES \
      -DBUILD_IMAGE=YES \
      -DBUILD_IMPORT=YES \
      -DBUILD_INSPECTION=YES \
      -DBUILD_JTREADER=NO \
      -DBUILD_MATERIAL=YES \
      -DBUILD_MESH=YES \
      -DBUILD_MESH_PART=YES \
      -DBUILD_OPENSCAD=YES \
      -DBUILD_PART=YES \
      -DBUILD_PART_DESIGN=YES \
      -DBUILD_PATH=NO \
      -DBUILD_POINTS=YES \
      -DBUILD_PLOT=YES \
      -DBUILD_RAYTRACING=YES \
      -DBUILD_REVERSEENGINEERING=YES \
      -DBUILD_ROBOT=YES \
      -DBUILD_SANDBOX=YES \
      -DBUILD_SHIP=YES \
      -DBUILD_SKETCHER=YES \
      -DBUILD_SPREADSHEET=YES \
      -DBUILD_START=YES \
      -DBUILD_TEMPLATE=YES \
      -DBUILD_TEST=YES \
      -DBUILD_VR=NO \
      -DBUILD_WEB=YES .

make -j4 2>&1 | tee output.txt
make install
# mkdir $PREFIX/bin -p
# ln -s ../lib/freecad/bin/FreeCAD $PREFIX/bin/freecad
# ln -s ../lib/freecad/bin/FreeCADCmd $PREFIX/bin/FreeCADCmd
rm ${PREFIX}/doc -r     # smaller size of package!
