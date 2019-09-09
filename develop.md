# TESTING AND DEBUGGING FreeCAD with dependencies from conda

# OUTDATED -> needs to be updated

This section is for testing new branches, or your own implementations/additions of Freecad with conda. This is interesting because conda gives us a nice way to gather all the sources we need to build FreeCAD. No need to download all the necessary libraries which have conflicts within them and with each other. Simply use the `develop` branch of this repo and follow these instruction:

- Clone this repository with: `git clone https://github.com/looooo/FreeCAD_Conda`
- Go to `FreeCAD_Conda/.FreeCAD_debug/build.sh` and modify the **FREECAD_SOURCE** variable at the top of the document.  
While you're at it, have a look at the `gcc` options. An older version is necessary! I have tested with 4.8 and 4.9. But most-likely the `gcc` shipped with conda is not compatible with the system `libstd`... So manually specifying `gcc` is necessary! This is not true for building with old linux versions. Especially if you build with docker and any-linux `gcc` from conda can be used (see [build.md](./build.md)).

- In the terminal `cd ./FreeCAD_Conda/develop/FreeCAD_debug/`
- Run `conda build .`

Note: you can also use the __--dirty__ flag BUT this will run CMake again, so there are more things getting rebuilt
in the build directory.  It is also possible to use [cmake-gui](https://cmake.org/cmake/help/v3.12/manual/cmake-gui.1.html) and use a graphical dialog to set/unset cmake flags.


# Setup with KDevelop (linux)
## Preparation
- conda installed
- channeld freecad and conda-forge added

## Setup
 1. Build with conda
```bash
cd FreeCAD_Conda/develop/FreeCAD_debug
conda build .
# abort once cmake is ready
ln -s ~/conda/conda-bld/freecad_debug/...b_env... ~/conda/env/fc_debug
```
 2. Activate the build environment: `source activate fc_debug`
 3. Start kdevelop from terminal (fc_debug environment)
 4. Open a project and choose the `CMakeList.txt` from FreeCAD
 5. Set build dir to `~/conda/conda-bld/freecad_debug..../work`
 6. in KDevelop press __Build__ (wait until build is done)
 7. configure executable in KDevelop:
- select FreeCAD in the project tree
- menu at top -> Run -> Configure Launches -> AddNew -> Compiled Binary
- check executable
- select *~/conda/conda-bld/freecad_debug/work/bin/FreeCAD*
 8. press __Execute__

if you want to run cmake again simply do:
```bash
cd FreeCAD_Conda/develop/FreeCAD_debug
conda build . --dirty
```


## Known Issues
- There is the possibility that the default conda install and the build environment are using the same python version. If this is the case you should set the variable **PYTHONHOME** explicitly to the build environment.

 **In kdevelop it's done like so:**
  - Run / configure launches
  - Select problematic version
  - Environment (press on the button on the right side)
  - On top press the arrow-"x" and type a new name
  - "add new group"
  - in the table enter "PYTHONHOME" and as value look for the path to the build-environment

<!--
  ### TODO for kdevelop:
   TODO: translate
   - Einstellungen->Kdevelop einrichten -> Erscheinungsbild -> Randbereich -> [x] Symbolspalte / [x] Zeilennummer
-->

## Basic Development Setup (Windows)

Win is always a bit more promblematic. But with some hacks it's possible to setup a development base with kdevelop on windows.

### Prerequisites
- Make sure you have installed conda
- Make sure you are familiar with basic conda commands
- Download and install latest kdevelop for windows https://www.kdevelop.org/download

### Get the FreeCAD source
- `git clone https://github.com/FreeCAD/FreeCAD`
- Make note of the path where the source was cloned to, this location will be called `%FREECAD_SRC%` 

### Get the source for building FreeCAD with conda
- `git clone https://github.com/FreeCAD/FreeCAD_Conda`
- The location where the FreeCAD conda install scripts were cloned to will be called `%FC_CONDA_SCRIPTS%`

### Creating a development build
- `cd %FC_CONDA_SCRIPTS%\freecad_debug`
- `conda build .`
- once the build process is starting press `ctrl-c` to abort

## Setup with KDevelop (Windows)

### Configure kdevelop
- This script works to invoke kdevelop with the right settings for the created build-environment. **Note:** edit the paths of the script to match your system.

```batch
call "C:\Users\fc_builder\Miniconda3\Scripts\activate.bat" "C:\Users\fc_builder\Miniconda3\envs\fc_debug"
call "C:\Program Files (x86)\Microsoft Visual Studio 14.0\Common7\Tools\..\..\VC\vcvarsall.bat" amd64

FOR /F "usebackq tokens=3*" %%A IN (`REG QUERY "HKEY_LOCAL_MACHINE\Software\KDE\KDevelop" /v Install_Dir`) DO (
    set appdir=%%A %%B
)

if NOT DEFINED appdir (
    FOR /F "usebackq tokens=3*" %%A IN (`REG QUERY "HKEY_LOCAL_MACHINE\Software\Wow6432Node\KDE\KDevelop" /v Install_Dir`) DO (
        set appdir=%%A %%B
    )
)

START "" "%appdir%\bin\kdevelop.exe"
```

- Once kdevelop is launched this way: create a new environment-:
	- `project/openconfiguration/show advanced/configure-environment (right button)`
	- Enter a name for the "Environment-group" (eg.: "fc_debug")
	- Go to batch-edit-mode (second button on the right side (hover over the buttons if you are not sure))
	- Enter these lines and configure to match your system:

```
FC_PYTHONHOME=C:\Users\fc_builder\Miniconda3\envs\fc_debug
QT_QPA_PLATFORM_PLUGIN_PATH=C:\Users\fc_builder\Miniconda3\envs\fc_debug\Library\plugins\platforms
```

## Setup with Visual Studio 2015 (Windows)
- Get Visual Studio 2015 community: I downloaded it from [here](https://www.computerbase.de/downloads/systemtools/entwicklung/visual-studio-2015/)
- Use a script to launch visual-studio: (**TODO: Fix this broken script**)

```batch
call "C:\Users\fc_builder\Miniconda3\Scripts\activate.bat" "C:\Users\fc_builder\Miniconda3\envs\fc_debug_vs"
call "C:\Program Files (x86)\Microsoft Visual Studio 14.0\Common7\Tools\..\..\VC\vcvarsall.bat" amd64

START  "" "C:\Program Files (x86)\Microsoft Visual Studio 14.0\Common7\IDE\devenv.exe"
```
