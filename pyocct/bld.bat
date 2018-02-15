mkdir build
cd build

cmake -G "Ninja" ^
      -D CMAKE_BUILD_TYPE=Release ^
      -D CMAKE_INSTALL_PREFIX:FILE_PATH="%LIBRARY_PREFIX%" ^
      -D CMAKE_PREFIX_PATH:FILE_PATH="%LIBRARY_PREFIX%" ^
      -D CMAKE_SYSTEM_PREFIX_PATH:FILE_PATH="%LIBRARY_PREFIX%" ^
      -D PTHREAD_INCLUDE_DIRS:FILE_PATH="%LIBRARY_PREFIX%/include" ^
      -D PTHREAD_LIB_DIRS:FILE_PATH="%LIBRARY_PREFIX%/lib" ^
      -D ENABLE_SMESH=OFF ^
      -D ENABLE_NETGEN=OFF ^
      -D ENABLE_BLSURF=OFF ^
      ..

if errorlevel 1 exit 1
ninja install
if errorlevel 1 exit 1
