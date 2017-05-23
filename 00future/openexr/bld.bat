cd IlmBase
mkdir -p build & cd build
cmake -G Ninja -DCMAKE_PREFIX_PATH=%LIBRARY_PREFIX% -DCMAKE_INSTALL_PREFIX:PATH=%LIBRARY_PREFIX% -DCMAKE_BUILD_TYPE=Release -DBUILD_SHARED_LIBS=ON ..
if errorlevel 1 exit 1
cmake --build .
if errorlevel 1 exit 1
cmake --build . --target install
if errorlevel 1 exit 1

cd %SRC_DIR%
cd OpenEXR
mkdir -p build & cd build
cmake -G Ninja -DCMAKE_PREFIX_PATH=%LIBRARY_PREFIX% -DCMAKE_INSTALL_PREFIX:PATH=%LIBRARY_PREFIX% -DCMAKE_BUILD_TYPE=Release -DBUILD_SHARED_LIBS=ON -DILMBASE_PACKAGE_PREFIX=%LIBRARY_PREFIX% ..
if errorlevel 1 exit 1
cmake --build .
if errorlevel 1 exit 1
cmake --build . --target install
if errorlevel 1 exit 1