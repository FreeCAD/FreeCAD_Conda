mkdir build -p
cd build 

cmake .. -G "NMake Makefiles" ^
    -DCMAKE_BUILD_TYPE="Release" ^
    -DINSTALL_DIR_LAYOUT="Unix" ^
    -DCMAKE_PREFIX_PATH:FILEPATH="%PREFIX%" ^
    -DCMAKE_INSTALL_PREFIX:FILEPATH="%LIBRARY_PREFIX%" ^
    -DINSTALL_DIR:FILEPATH="%LIBRARY_PREFIX%" ^
    -DOCC_INCLUDE_DIR:FILEPATH="%LIBRARY_PREFIX%\include\opencascade" ^
    -DOCC_LIBRARY_DIR:FILEPATH="%LIBRARY_PREFIX%\lib" ^
    -DUSE_OCC=ON ^
    -DUSE_PYTHON=ON ^
    -DUSE_GUI=OFF ^
    -DUSE_SUPERBUILD=OFF

if errorlevel 1 exit 1
set CL=/MP
nmake install
if errorlevel 1 exit 1

mkdir %LIBRARY_PREFIX%\include\netgen -p
rem this line is not correct. There is already a mydef.hpp in the include files
rem better just move the config.h and make FreeCAD-cmake look for a congfig.h instead of 
rem a mydefs.hpp
Copy %SRC_DIR%\build\config.h %LIBRARY_PREFIX%\include\netgen\mydefs.hpp