mkdir -p build
cd build

cmake -G "Ninja" ^
      -D CMAKE_INSTALL_PREFIX="%LIBRARY_PREFIX%" ^
      -D CMAKE_BUILD_TYPE:STRING=Release ^
      -D BUILD_PYTHON:BOOL=ON ^
      -D ENABLE_GUI:BOOL=OFF ^
      ..

ninja _slvs -v -w dupbuild=warn

copy "src\swig\python\_slvs.pyd" "%SP_DIR%"
copy "src\swig\python\slvs.py" "%SP_DIR%"