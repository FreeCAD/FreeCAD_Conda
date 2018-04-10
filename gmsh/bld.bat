mkdir build
cd build

# build.
cmake -G "Ninja" ^
      -D CMAKE_INSTALL_PREFIX=$PREFIX ^
      -D ENABLE_OS_SPECIFIC_INSTALL=OFF ^
      -D ENABLE_MATCH=OFF ^
      -D ENABLE_PETSC=OFF ^
      -D ENABLE_SLEPC=OFF ^
      -D ENABLE_OCC=ON ^
      -D ENABLE_MPI=OFF ^
      ..

ninja install