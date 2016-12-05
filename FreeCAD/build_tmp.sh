export PREFIX=/home/lo/anaconda
export PREFIX_ENV=$PREFIX/envs/fc_2_build/
export SYS_PREFIX=$PREFIX
export SYS_PYTHON=$PREFIX/bin/python

cmake -DCMAKE_BUILD_TYPE=Debug \
      -DCMAKE_INSTALL_PREFIX=$PREFIX_ENV \
      -DCMAKE_PREFIX_PATH=$PREFIX_ENV \
      -DNETGENDATA=$PREFIX_ENV/include/netgen/libsrc \
      -DNETGEN_INCLUDEDIR=$PREFIX_ENV/include/netgen/nglib \
      -DNGLIB_INCLUDE_DIR=$PREFIX_ENV/include/netgen/nglib \
      -DBUILD_FEM_NETGEN=YES \
      -DFREECAD_USE_OCC_VARIANT="Official Version" \
      -DOCC_INCLUDE_DIR=$PREFIX_ENV/include/opencascade \
      -DOCC_LIBRARY_DIR=$PREFIX_ENV/lib \
      -DOCC_LIBRARIES=$PREFIX_ENV/lib CACHE PATH \
      -DOCC_OCAF_LIBRARIES=$PREFIX_ENV/lib CACHE PATH \
      ..