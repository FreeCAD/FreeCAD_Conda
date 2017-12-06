SET FREECAD_SOURCE="C:\Users\fc_builder\projects\FreeCAD"


rem use this line if you want to build with visual studio
rem cmake -G "Visual Studio 14 2015 Win64" ^
cmake -G "Ninja" ^
      -DCMAKE_BUILD_TYPE=Release ^
      -DFREECAD_LIBPACK_USE=FALSE ^
      -DCMAKE_INSTALL_PREFIX=%LIBRARY_PREFIX% ^
      -DCMAKE_PREFIX_PATH=%LIBRARY_PREFIX% ^
      -DCMAKE_INCLUDE_PATH=%LIBRARY_PREFIX%/include ^
      -DCMAKE_LIBRARY_PATH=%LIBRARY_PREFIX%/lib ^
      -DBUILD_QT5=ON ^
      -BUILD_ENABLE_CXX14=ON ^
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
      -DBUILD_REVERSEENGINEERING=NO ^
      -BUILD_ENABLE_CXX14=ON ^
      %FREECAD_SOURCE%

exit 1
rem do not install and make conda-build fail
rem now setup the ide (kdevelop, visual-studio) to work with conda-packages