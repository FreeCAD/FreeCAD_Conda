mkdir build
cd build 

cmake ..\src -G "Ninja" ^
    -DCMAKE_BUILD_TYPE="Release" ^
    -DCMAKE_PREFIX_PATH:FILEPATH="%PREFIX%" ^
    -DCMAKE_INSTALL_PREFIX:FILEPATH="%LIBRARY_PREFIX%"

if errorlevel 1 exit 1
ninja install
if errorlevel 1 exit 1
