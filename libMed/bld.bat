cmake . -G "Ninja" ^
    -DCMAKE_PREFIX_PATH=%PREFIX% ^
    -DCMAKE_INSTALL_PREFIX=%LIBRARY_PREFIX% ^
    -DHDF5_LIBRARIES=%LIBRARY_PREFIX%\lib\libhdf5.lib;%LIBRARY_PREFIX%\lib\zlib.lib ^
    -DHDF5_ROOT_DIR=%LIBRARY_PREFIX% ^
    -DMEDFILE_INSTALL_DOC=OFF

rem MEDFILE_BUILD_PYTHON -> swig, maybe this is a nice option

if errorlevel 1 exit 1
ninja install
if errorlevel 1 exit 1

rmdir /s /q %LIBRARY_PREFIX%\share