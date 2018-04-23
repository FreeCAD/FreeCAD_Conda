mkdir build
cd build

cmake -G "Ninja" ^
      -D CMAKE_BUILD_TYPE=Release ^
      -D PTHREAD_INCLUDE_DIRS:FILEPATH="%LIBRARY_PREFIX%/include" ^
      -D ENABLE_SMESH=ON ^
      -D ENABLE_NETGEN=ON ^
      -D ENABLE_BLSURF=OFF ^
       ..

if errorlevel 1 exit 1
ninja install
if errorlevel 1 exit 1

cd C:\Users\hans_\projects\pyOCCT
%PYTHON% setup.py install
