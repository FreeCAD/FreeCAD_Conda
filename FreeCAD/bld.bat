rem %PYTHON% %RECIPE_DIR%/win_path.py %LIBRARY_PREFIX%/lib/cmake/PySide-1.2.4/PySideConfig.cmake
rem %PYTHON% %RECIPE_DIR%/win_path.py %LIBRARY_PREFIX%/lib/cmake/PySide-1.2.4/PySideConfig-python3.5.cmake
rem %PYTHON% %RECIPE_DIR%/win_path.py %LIBRARY_PREFIX%/lib/cmake/PySide-1.2.4/PySideConfigVersion.cmake
rem %PYTHON% %RECIPE_DIR%/win_path.py %LIBRARY_PREFIX%/lib/cmake/Shiboken-1.2.4/ShibokenConfig.cmake
rem %PYTHON% %RECIPE_DIR%/win_path.py %LIBRARY_PREFIX%/lib/cmake/Shiboken-1.2.4/ShibokenConfig-python3.5.cmake
rem %PYTHON% %RECIPE_DIR%/win_path.py %LIBRARY_PREFIX%/lib/cmake/Shiboken-1.2.4/ShibokenConfigVersion.cmake
rem copy %RECIPE_DIR%\PySideConfig-python3.5.cmake %LIBRARY_PREFIX%\lib\cmake\PySide-1.2.4\PySideConfig-python3.5.cmake

cmake . -G "Ninja" ^
      -DCMAKE_BUILD_TYPE=Release ^
      -DFREECAD_LIBPACK_USE=FALSE ^
      -DCMAKE_INSTALL_PREFIX=%LIBRARY_PREFIX% ^
      -DCMAKE_PREFIX_PATH=%LIBRARY_PREFIX% ^
      -DCMAKE_INCLUDE_PATH=%LIBRARY_PREFIX%/include ^
      -DCMAKE_LIBRARY_PATH=%LIBRARY_PREFIX%/lib ^
      -DNETGENDATA=%LIBRARY_PREFIX%/include ^
      -DNETGEN_INCLUDEDIR=%LIBRARY_PREFIX%/include/netgen ^
      -DNGLIB_INCLUDE_DIR=%LIBRARY_PREFIX%/include/nglib ^
      -DOCC_INCLUDE_DIR=%LIBRARY_PREFIX%/include/opencascade ^
      -DOCC_LIBRARY_DIR=%LIBRARY_PREFIX%/lib ^
      -DOCC_LIBRARIES=%LIBRARY_PREFIX%/lib CACHE ^
      -DFREECAD_USE_OCC_VARIANT="Official Version" ^
      -DOCC_OCAF_LIBRARIES=%LIBRARY_PREFIX%/lib ^
      -DSWIG_DIR=%LIBRARY_PREFIX%/share/swig/3.0.8 ^
      -DSWIG_EXECUTABLE=%LIBRARY_PREFIX%/bin/swig ^
      -DPYTHON_EXECUTABLE=%PYTHON% ^
      -DBUILD_FEM_NETGEN=YES ^
      -DBUILD_ARCH=YES ^
      -DBUILD_ASSEMBLY=NO ^
      -DBUILD_COMPLETE=YES ^
      -DBUILD_DRAFT=YES ^
      -DBUILD_DRAWING=YES ^
      -DBUILD_FEM=YES ^
      -DBUILD_GUI=YES ^
      -DBUILD_IDF=YES ^
      -DBUILD_IMAGE=YES ^
      -DBUILD_IMPORT=YES ^
      -DBUILD_INSPECTION=YES ^
      -DBUILD_JTREADER=NO ^
      -DBUILD_MATERIAL=YES ^
      -DBUILD_MESH=YES ^
      -DBUILD_MESH_PART=YES ^
      -DBUILD_OPENSCAD=YES ^
      -DBUILD_PART=YES ^
      -DBUILD_PART_DESIGN=YES ^
      -DBUILD_PATH=NO ^
      -DBUILD_POINTS=YES ^
      -DBUILD_PLOT=YES ^
      -DBUILD_RAYTRACING=YES ^
      -DBUILD_REVERSEENGINEERING=YES ^
      -DBUILD_ROBOT=YES ^
      -DBUILD_SANDBOX=YES ^
      -DBUILD_SHIP=YES ^
      -DBUILD_SKETCHER=YES ^
      -DBUILD_SPREADSHEET=YES ^
      -DBUILD_START=YES ^
      -DBUILD_TEMPLATE=YES ^
      -DBUILD_TEST=YES ^
      -DBUILD_VR=NO ^
      -DBUILD_WEB=YES .


if errorlevel 1 exit 1
ninja install
if errorlevel 1 exit 1

rmdir /s /q %LIBRARY_PREFIX%/doc