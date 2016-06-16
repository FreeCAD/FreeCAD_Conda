# conda builds for FreeCAD and dependencies

## TODO

- download latest source code before installation
- understand how anaconda builds packages
- create a main freecad conda repo
- insert all the recipes


## install conda
download conda...

## installing with conda
conda install freecad

## dependencies
- boost
- coin
- pyside

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
