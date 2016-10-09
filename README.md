# conda builds for FreeCAD and dependencies

## TODO

- create a freecad build enviroment (there are missing some enviromentvariabvles -> libuuid error)
- occt to conda-forge
- build netgen with python3
- update eigen3.3 once it is released, or better use the conda-forge one


## install conda
download conda...

## installing with conda
conda install freecad

## dependencies
- [x] coin
- [x] netgen
- [x] occt

## build a package
```shell
cd FreeCAD_conda/packageName
conda build .
```

## upload package
the command is shown at the end of the build-process
```shell
anaconda upload filepath
```
