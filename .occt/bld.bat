mkdir build
cd build

set BUILD_CONFIG=Release


cmake -G "Ninja" ^
    -DCMAKE_BUILD_TYPE=%BUILD_CONFIG% ^
    -DCMAKE_PREFIX_PATH=$PREFIX ^
    -DUSE_VTK=ON ^
    -DCMAKE_INSTALL_PREFIX:PATH="%LIBRARY_PREFIX%" ..

ninja install
