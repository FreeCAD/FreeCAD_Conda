FREECAD_SOURCE=~/projects/FreeCAD # this is the path to the FreeCAD source (modyfy to your needs)
BUILD_FULL=false                  # run cmake .. if true, if not use the --dirty flag of conda (maybe this can be automated)


if [ "$BUILD_FULL" = true ] ; then
    VERBOSE=1 cmake -DCMAKE_BUILD_TYPE=Debug \
          -DCMAKE_INSTALL_PREFIX=$PREFIX \
          -DCMAKE_PREFIX_PATH=$PREFIX \
          -DNETGENDATA=$PREFIX/include/netgen/libsrc \
          -DNETGEN_INCLUDEDIR=$PREFIX/include/netgen/nglib \
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
          -DBUILD_ARCH=ON \
          -DBUILD_ASSEMBLY=NO \
          -DBUILD_COMPLETE=ON \
          -DBUILD_DRAFT=ON \
          -DBUILD_DRAWING=ON \
          -DBUILD_FEM=ON \
          -DBUILD_GUI=YES \
          -DBUILD_IDF=ON \
          -DBUILD_IMAGE=ON \
          -DBUILD_IMPORT=ON \
          -DBUILD_INSPECTION=ON \
          -DBUILD_JTREADER=OFF \
          -DBUILD_MATERIAL=ON \
          -DBUILD_MESH=ON \
          -DBUILD_MESH_PART=ON \
          -DBUILD_OPENSCAD=ON \
          -DBUILD_PART=YES \
          -DBUILD_PART_DESIGN=ON \
          -DBUILD_PATH=ON \
          -DBUILD_POINTS=ON \
          -DBUILD_PLOT=ON \
          -DBUILD_RAYTRACING=ON \
          -DBUILD_REVERSEENGINEERING=ON \
          -DBUILD_ROBOT=ON \
          -DBUILD_SANDBOX=ON \
          -DBUILD_SHIP=ON \
          -DBUILD_SKETCHER=ON \
          -DBUILD_SPREADSHEET=ON \
          -DBUILD_START=ON \
          -DBUILD_TEMPLATE=ON \
          -DBUILD_TEST=ON \
          -DBUILD_VR=NO \
          -DBUILD_WEB=ON \
          -DBUILD_TECHDRAW=ON ${FREECAD_SOURCE}
fi

make -j5 2>&1 | tee output.txt
make install -j5
# mkdir $PREFIX/bin -p
# ln -s ../lib/freecad/bin/FreeCAD $PREFIX/bin/freecad
# ln -s ../lib/freecad/bin/FreeCADCmd $PREFIX/bin/FreeCADCmd
rm ${PREFIX}/doc -r     # smaller size of package!
