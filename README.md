# conda builds for FreeCAD and dependencies

## TODO

- [x] download latest source code before installation
- [x] understand how anaconda builds packages
- [x] create a main freecad conda repo
- [ ] insert all the recipes
- [ ] plugins


## install conda
download conda...

## installing with conda
conda install freecad

## dependencies
- [ ] boost
- [ ] coin
- [ ] pyside
- [ ] shiboken
- [ ] netgen
- [ ] smesh
- [ ] occt

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
