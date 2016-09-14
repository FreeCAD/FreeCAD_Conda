PREFIX="/home/lorenz/miniconda2/envs/fc_2"
cmake -DCMAKE_BUILD_TYPE=Debug \
      -DNETGENDATA=$PREFIX/include/netgen/libsrc \
      -DNETGEN_INCLUDEDIR=$PREFIX/include/netgen/nglib \
      -DBUILD_FEM_NETGEN=YES \
      -DOCC_INCLUDE_DIR=$PREFIX/include/opencascade \
      -DOCC_LIBRARY_DIR=$PREFIX/lib \
      -DOCC_LIBRARIES=$PREFIX/lib CACHE PATH \
      -DOCC_OCAF_LIBRARIES=$PREFIX/lib CACHE PATH \
      ..