cmake . -G "Ninja" ^
    -DINSTALL_DIR_LAYOUT="Unix" ^
    -DCMAKE_PREFIX_PATH=%PREFIX% ^
    -DCMAKE_INSTALL_PREFIX=%LIBRARY_PREFIX% ^
    -DHDF5_LIBRARIES=%LIBRARY_PREFIX%\lib\libhdf5.lib

if errorlevel 1 exit 1
ninja install
if errorlevel 1 exit 1
