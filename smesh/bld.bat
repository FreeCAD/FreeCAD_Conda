mkdir build
cd build

cmake -G "Ninja" ^
    -DCMAKE_INSTALL_PREFIX="%LIBRARY_PREFIX%" ^
    -DCMAKE_BUILD_TYPE=RelWithDebInfo ^
    -DRAISE_EXCEPTION_ON_FAILURE=ON ^
    -DCMAKE_PREFIX_PATH="%LIBRARY_PREFIX%" ^
    -DCMAKE_SYSTEM_PREFIX_PATH="%LIBRARY_PREFIX%" ^
    -DSMESH_USE_BUNDLED_BOOST=ON ^
    -DOCE_INCLUDE_PATH=%LIBRARY_PREFIX%\include\opencascade ^
    -DOCE_LIB_PATH=%LIBRARY_PREFIX%\lib ^
    ..

if errorlevel 1 exit 1
ninja install
if errorlevel 1 exit 1
