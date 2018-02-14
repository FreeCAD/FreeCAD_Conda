mkdir build
cd build

cmake .. -G "Ninja" ^
      -DCMAKE_BUILD_TYPE=Release ^
      -DFREECAD_LIBPACK_USE=FALSE ^
      -DCMAKE_INSTALL_PREFIX=%LIBRARY_PREFIX% ^
      -DCMAKE_PREFIX_PATH=%LIBRARY_PREFIX% ^
      -DCMAKE_INCLUDE_PATH=%LIBRARY_PREFIX%/include ^
      -DCMAKE_LIBRARY_PATH=%LIBRARY_PREFIX%/lib ^
      -DBUILD_QT5=ON ^
      -DNETGENDATA=%LIBRARY_PREFIX%/include/netgen ^
      -DNETGEN_INCLUDEDIR=%LIBRARY_PREFIX%/include/netgen ^
      -DNGLIB_INCLUDE_DIR=%LIBRARY_PREFIX%/include/nglib ^
      -DOCC_INCLUDE_DIR=%LIBRARY_PREFIX%/include/opencascade ^
      -DOCC_LIBRARY_DIR=%LIBRARY_PREFIX%/lib ^
      -DOCC_LIBRARIES=%LIBRARY_PREFIX%/lib ^
      -DFREECAD_USE_OCC_VARIANT="Official Version" ^
      -DOCC_OCAF_LIBRARIES=%LIBRARY_PREFIX%/lib ^
      -DSWIG_DIR=%LIBRARY_PREFIX%/share/swig/3.0.8 ^
      -DSWIG_EXECUTABLE=%LIBRARY_PREFIX%/bin/swig ^
      -DPYTHON_EXECUTABLE=%PYTHON% ^
      -DUSE_BOOST_PYTHON=NO ^
      -DFREECAD_USE_PYBIND11=YES ^
      -DBUILD_REVERSEENGINEERING=NO


if errorlevel 1 exit 1
ninja install
if errorlevel 1 exit 1

rmdir /s /q "%LIBRARY_PREFIX%\doc"
