mkdir build
cd build

cmake -G "Ninja" ^
    -DCMAKE_INSTALL_PREFIX:FILEPATH="%LIBRARY_PREFIX%" ^
    -DCMAKE_PREFIX_PATH:FILEPATH="%LIBRARY_PREFIX%" ^
    -DCMAKE_SYSTEM_PREFIX_PATH:FILEPATH="%LIBRARY_PREFIX%" ^
    -DOCE_INCLUDE_PATH:FILEPATH=%LIBRARY_PREFIX%\include\opencascade ^
    -DOCE_LIB_PATH:FILEPATH=%LIBRARY_PREFIX%\lib ^
    ..

if errorlevel 1 exit 1
ninja install
if errorlevel 1 exit 1
