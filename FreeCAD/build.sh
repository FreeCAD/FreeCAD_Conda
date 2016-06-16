VERBOSE=1 cmake -DCMAKE_BUILD_TYPE=Release \
      -DCMAKE_INSTALL_PREFIX=$PREFIX \
      -DCMAKE_PREFIX_PATH=$PREFIX \
      -DSWIG_DIR=$PREFIX/share/swig/3.0.8 \
      -DSWIG_EXECUTABLE=$PREFIX/bin/swig \
      -DPYTHON_EXECUTABLE=$PYTHON \
      .

      # -DBUILD_FEM_NETGEN=YES \
      # -DBUILD_ARCH=NO \
      # -DBUILD_ASSEMBLY=NO \
      # -DBUILD_COMPLETE=NO \
      # -DBUILD_DRAFT=NO \
      # -DBUILD_DRAWING=NO \
      # -DBUILD_FEM=NO \
      # -DBUILD_GUI=YES \
      # -DBUILD_IDF=NO \
      # -DBUILD_IMAGE=NO \
      # -DBUILD_IMPORT=NO \
      # -DBUILD_INSPECTION=YES \
      # -DBUILD_JTREADER=NO \
      # -DBUILD_MATERIAL=NO \
      # -DBUILD_MESH=NO \
      # -DBUILD_MESH_PART=NO \
      # -DBUILD_OPENSCAD=NO \
      # -DBUILD_PART=YES \
      # -DBUILD_PART_DESIGN=NO \
      # -DBUILD_PATH=NO \
      # -DBUILD_POINTS=NO \
      # -DBUILD_PLOT=NO \
      # -DBUILD_RAYTRACING=NO \
      # -DBUILD_REVERSEENGINEERING=NO \
      # -DBUILD_ROBOT=NO \
      # -DBUILD_SANDBOX=NO \
      # -DBUILD_SHIP=NO \
      # -DBUILD_SKETCHER=NO \
      # -DBUILD_SPREADSHEET=NO \
      # -DBUILD_START=NO \
      # -DBUILD_TEMPLATE=NO \
      # -DBUILD_TEST=NO \
      # -DBUILD_VR=NO \
      # -DBUILD_WEB=NO .

make install -j4
rm ${PREFIX}/doc -r     # smaller size of package!
