mkdir build -p
cd build 

cmake .. -G "Ninja" ^
    -DCMAKE_PREFIX_PATH:FILEPATH="%PREFIX%" ^
    -DCMAKE_INSTALL_PREFIX:FILEPATH="%LIBRARY_PREFIX%" ^
    -DINSTALL_DIR="%LIBRARY_PREFIX%" ^
    -DINSTALL_DIR_LAYOUT="Unix" ^
    -DTK_LIBRARY_PATH:FILEPATH="%LIBRARY_PREFIX%" ^
    -DTCL_LIBRARY_PATH_PARENT="%LIBRARY_PREFIX%" ^
    -DCMAKE_BUILD_TYPE="Release" ^
    -DINCDIR=:FILEPATH=%LIBRARY_PREFIX%/include/netgen ^
    -DUSE_OCC=ON ^
    -DUSE_PYTHON=OFF ^
    -DUSE_GUI=OFF ^
    -DUSE_SUPERBUILD=OFF ^
    -DOCC_INCLUDE_DIR=%LIBRARY_PREFIX%/include/opencascade ^
    -DOCC_LIBRARY_DIR=%LIBRARY_PREFIX%/lib ^
    -DTK_LIBRARY_PATH:FILEPATH=%LIBRARY_PREFIX% ^
    -DTCL_LIBRARY_PATH_PARENT=%LIBRARY_PREFIX% ^
    -DPYBIND_INCLUDE_DIRS=%PREFIX%/include/python3.5

if errorlevel 1 exit 1

ninja install
if errorlevel 1 exit 1

mkdir %LIBRARY_PREFIX%/include/netgen -p

rem rsync -avm --include='*.h*' -f 'hide,! */' .. ${PREFIX}/include/netgen
rem cp ${PREFIX}/include/netgen/build/netgen/config.h ${PREFIX}/include/netgen/mydefs.hpp
rem rm ${PREFIX}/include/netgen/build -r