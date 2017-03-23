#  PYSIDE_INCLUDE_DIR   - Directories to include to use PySide
#  PYSIDE_LIBRARY       - Files to link against to use PySide
#  PYSIDE_PYTHONPATH    - Path to where the PySide Python module files could be found
#  PYSIDE_TYPESYSTEMS   - Type system files that should be used by other bindings extending PySide

SET(PYSIDE_INCLUDE_DIR "%CMAKE_PREFIX_PATH%/include/PySide")
# Platform specific library names
if(MSVC)
    SET(PYSIDE_LIBRARY "%CMAKE_PREFIX_PATH%/lib/pyside-python3.5.lib")
elseif(CYGWIN)
    SET(PYSIDE_LIBRARY "%CMAKE_PREFIX_PATH%/lib/pyside-python3.5.lib")
elseif(WIN32)
    SET(PYSIDE_LIBRARY "%CMAKE_PREFIX_PATH%/bin/pyside-python3.5.dll")
else()
    SET(PYSIDE_LIBRARY "%CMAKE_PREFIX_PATH%/lib/pyside-python3.5.dll")
endif()
SET(PYSIDE_PYTHONPATH "%CMAKE_PREFIX_PATH%/../Lib/site-packages")
SET(PYSIDE_TYPESYSTEMS "%CMAKE_PREFIX_PATH%/share/PySide/typesystems")
