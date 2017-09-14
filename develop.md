# TESTING AND DEBUGGING FreeCAD with dependencies from conda

This section is for testing new branches, or your own implementations/additions of Freecad with conda. This is interesting, because conda gives us a nice way to gather all the sources we need to build FreeCAD. No need to download all the necessary libraries which have conflicts all over. Simple use the develop branch of this repo and follow this instruction.

- ```git clone https://github.com/looooo/FreeCAD_Conda # this branch```
- go to *FreeCAD_Conda/.FreeCAD_debug/build.sh* and modify the FREECAD_SOURCE Variable at the top of the document
Also have a look at the gcc options. An old version is needed! I have tested with 4.8 and 4.9. But most-likely the gcc shipped with conda is not compatible with the system libstd... So manually specifying gcc is necessary! This is not true for building with old linux versions. Especially if you build with docker and any-linux gcc from conda can be used(see build.md)

- in the terminal go to *FreeCAD_Conda/develop/FreeCAD_debug/*
- ```conda build . --python=3.5  # or 2.7```

when you have an error you can go to the build directory something like
~/miniconda3/conda-bld/FreeCAD_123423342/work
- ```source activate ../ # to activate the build enviroment```
- ```make # to build again```

you can also use the __--dirty__ flag but this will run cmake again, so there are more things getting rebuild
in the build directory you can also use cmake-gui.


# setup with KDevelop (linux)
## preperation:
- conda installed
- channeld freecad and conda-forge added

## setup
 1. build with conda
```bash
cd FreeCAD_Conda/develop/FreeCAD_debug
conda build . --python=3.5
# abort once cmake is ready
ln -s ~/conda/conda-bld/freecad_debug/...b_env... ~/conda/env/fc_debug
```
 2. activate the build environment
```source activate fc_debug```
 3. start kdevelop from terminal (fc_debug environment)
 4. open a project and choose the CMakeList.txt from FreeCAD
 5. set build dir to ~/conda/conda-bld/freecad_debug..../work
 6. in KDevelop press __Build__ (wait until build is done)
 7. configure executable in KDevelop:
- select FreeCAD in the project tree
- menu at top -> Run -> Configure Launches -> AddNew -> Compiled Binary
- check executable
- select *~/conda/conda-bld/freecad_debug/work/bin/FreeCAD*
 8. press __Execute__

if you want to run cmake again simple do:
```bash
cd FreeCAD_Conda/develop/FreeCAD_debug
conda build . --python=3.5 --dirty
```


## problems
- there is the chance the default conda and the build environment are using the same python version. If this is the case you should set the variable PYTHONHOME explicitly to the build environment.
in kdevelop: 
 - run / configure launches
 - select problematic version
 - Environmen (press on the button on the right side)
 - on top press the arrow-"x" and type a new name
 - "add new group"
 - in the table enter "PYTHONHOME" and as value look for the path to the build-environment

 ## some notes to kdevelop:
 TODO: translate
 - Einstellungen->Kdevelop einrichten -> Erscheinungsbild -> Randbereich -> [x] Symbolspalte / [x] Zeilennummer


# setup with KDevelop (win)

win is allwys a bit more difficult. But with some hacks it's possible to setup a development base with kdevelop on windows.

## Preperation:
- make sure you have installed conda
- make sure you are familiar with basic conda commands
- download and install latest kdevelop for windows https://www.kdevelop.org/download

## get the FreeCAD source
- this is as simple as `git clone https://github.com/FreeCAD/FreeCAD`
- remember the path where the source is located this location will be called %FREECAD_SRC% for further instructions

## get the sources for building FreeCAD with conda
- `git clone https://github.com/FreeCAD/FreeCAD_Conda`
- the location where the conda install scripts are will be called `%FC_CONDA_SCRIPTS%`

## creating a development build
- `cd %FC_CONDA_SCRIPTS%\freecad_debug`
- `conda build .`
- once the build process is starting press `ctrl-c` to apport

## configure kdevelop
- open a file browser and look for the place where kdevelop is installed.: eg C:\Program Files\KDevelop
- once found open the bin directory and copy the file `kdevelop-msvc.bat` to the desctop or anywhere where you can make changes to that file.
- open the copied file in a text-editor.
- look for this line: `CALL %script%` and edit the line so it matches: `CALL %script% amd64`
- after this line add: `CALL %PATH_TO_CONDA%Scripts\activate %PATH_TO_BUILD_ENV%
- for me this looks like this:
```
CALL C:\Users\fc_builder\conda64\Scripts\activate C:\Users\fc_builder\conda64\conda-bld\freecad-debug_1505378983749\_b_env
```
