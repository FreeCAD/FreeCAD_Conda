PREFIX="~/anaconda/envs/fc_2_build"
cmake -DCMAKE_BUILD_TYPE=Debug \
      -DNETGENDATA=$PREFIX/include/netgen/libsrc \
      -DNETGEN_INCLUDEDIR=$PREFIX/include/netgen/nglib \
      -DBUILD_FEM_NETGEN=YES \
      -DOCC_MANUAL_PATH=$PREFIX \
      ..