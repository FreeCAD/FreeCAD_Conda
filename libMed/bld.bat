cmake . -G "NMake Makefiles" ^
    -DCMAKE_PREFIX_PATH=%PREFIX% ^
    -DCMAKE_INSTALL_PREFIX=%LIBRARY_PREFIX% ^
    -DHDF5_LIBRARIES=%LIBRARY_PREFIX%\lib\libhdf5.lib;%LIBRARY_PREFIX%\lib\zlib.lib ^
    -DHDF5_ROOT_DIR=%LIBRARY_PREFIX% ^
    -DCMAKE_BUILD_TYPE=Release ^
    -DMEDFILE_INSTALL_DOC=OFF

rem MEDFILE_BUILD_PYTHON -> swig, maybe this is a nice option

if errorlevel 1 exit 1
set CL=/MP
nmake install
if errorlevel 1 exit 1

move %LIBRARY_PREFIX%\lib\medC.dll %LIBRARY_PREFIX%\bin
move %LIBRARY_PREFIX%\lib\medimport.dll %LIBRARY_PREFIX%\bin
