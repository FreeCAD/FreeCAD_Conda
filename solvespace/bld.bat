mkdir -p build
cd build

cmake -G "Ninja" ^
      -D CMAKE_INSTALL_PREFIX="%LIBRARY_PREFIX%" ^
      -D CMAKE_BUILD_TYPE=Release ^
      -D BUILD_PYTHON=ON ^
      ..

ninja _slvs -v
copy "src\swig\python\_slvs.so" "%SP_DIR%"
copy "src\swig\python\slvs.py" "%SP_DIR%"