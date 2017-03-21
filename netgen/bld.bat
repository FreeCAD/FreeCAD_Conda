mkdir build -p
cd build 

cmake .. -G "Ninja" ^
    -DCMAKE_BUILD_TYPE="Release" ^
    -DINSTALL_DIR_LAYOUT="Unix" ^
    -DCMAKE_PREFIX_PATH:FILEPATH="%PREFIX%" ^
    -DCMAKE_INSTALL_PREFIX:FILEPATH="%LIBRARY_PREFIX%" ^
    -DINSTALL_DIR_FILEPATH="%LIBRARY_PREFIX%" ^
    -DINCDIR:FILEPATH=%LIBRARY_PREFIX%/include/netgen ^
    -DOCC_INCLUDE_DIR:FILEPATH=%LIBRARY_PREFIX%/include/opencascade ^
    -DOCC_LIBRARY_DIR:FILEPATH=%LIBRARY_PREFIX%/lib ^
    -DUSE_OCC=ON ^
    -DUSE_PYTHON=OFF ^
    -DUSE_GUI=OFF ^
    -DUSE_SUPERBUILD=OFF ^

if errorlevel 1 exit 1

ninja install
if errorlevel 1 exit 1

mkdir %LIBRARY_PREFIX%/include/netgen -p
Copy %SRC_DIR%\build\config.h %PREFIX%\include\netgen\mydefs.hpp