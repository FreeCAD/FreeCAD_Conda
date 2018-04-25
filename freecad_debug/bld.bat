SET FREECAD_SOURCE="C:\Users\hans_\projects\FreeCAD"


rem use this line if you want to build with visual studio
rem cmake -G "Visual Studio 14 2015 Win64" ^
cmake -G "Ninja" ^
      -D CMAKE_BUILD_TYPE=Release ^
      -D FREECAD_LIBPACK_USE=FALSE ^
      -D CMAKE_INSTALL_PREFIX:FILEPATH=%LIBRARY_PREFIX% ^
      -D CMAKE_PREFIX_PATH:FILEPATH=%LIBRARY_PREFIX% ^
      -D CMAKE_INCLUDE_PATH:FILEPATH=%LIBRARY_PREFIX%/include ^
      -D CMAKE_LIBRARY_PATH:FILEPATH=%LIBRARY_PREFIX%/lib ^
      -D BUILD_QT5=ON ^
      -D NETGENDATA:FILEPATH=%LIBRARY_PREFIX%/include/netgen ^
      -D NGLIB_INCLUDE_DIR:FILEPATH=%LIBRARY_PREFIX%/include/netgen ^
      -D BUILD_FEM_NETGEN:BOOL=YES ^
      -D OCC_INCLUDE_DIR:FILEPATH=%LIBRARY_PREFIX%/include/opencascade ^
      -D OCC_LIBRARY_DIR:FILEPATH=%LIBRARY_PREFIX%/lib ^
      -D OCC_LIBRARIES:FILEPATH=%LIBRARY_PREFIX%/lib ^
      -D FREECAD_USE_OCC_VARIANT="Official Version" ^
      -D OCC_OCAF_LIBRARIES:FILEPATH=%LIBRARY_PREFIX%/lib ^
      -D SWIG_DIR:FILEPATH=%LIBRARY_PREFIX%/share/swig/3.0.8 ^
      -D SWIG_EXECUTABLE:FILEPATH=%LIBRARY_PREFIX%/bin/swig ^
      -D PYTHON_EXECUTABLE=%PYTHON% ^
      -D BUILD_REVERSEENGINEERING=NO ^
      -D USE_BOOST_PYTHON=NO ^
      -D FREECAD_USE_PYBIND11=YES ^
      -D SMESH_INCLUDE_DIR:FILEPATH=%LIBRARY_PREFIX%/include/smesh ^
      -D FREECAD_USE_EXTERNAL_SMESH=ON ^
      %FREECAD_SOURCE%

exit 1
rem do not install and make conda-build fail
rem now setup the ide (kdevelop, visual-studio) to work with conda-packages
