# Building FreeCAD and dependencies with conda

With conda only the most general dependencies are used from the system. Therefor nearly all dependencies of FreeCAD have to be build.
conda-forge is a github-organization containing many dependencies of FreeCAD. With this channel added to the condarc-channels-section the number of packages we have to maintain for freecad is not that high.

Most of the freecad-relevant packages are now __conda-forge-feedstocks__ and listed as subrepos of [FreeCAD_Conda](https://github.com/FreeCAD/FreeCAD_Conda).

All conda-forge-feedstocks are build automatically by ci's for osx, linux and windows. This way it's easy to collaborate and fix build-problems. So if you encounter any problem which can be fixed by build-instructions, or if you want a newer version of a library please navigate to the corresponding feedstock, fork this feedstock on github and add changes. Once done create a pullrequenst and see if the build succeeds on all plattforms.

Conda-forge uses build-tools from anaconda. These tools (compiler, build-environments, ...) are also changing. To keep a feedstock updated __conda-smithy__ should be used. This can be easily done in a PR by following the instructions listed here: https://github.com/FreeCAD/FreeCAD_Conda

To build packages locally (not with ci's) we use __conda-build__. conda-build is the tool to create a package from a __conda-recipe__. A conda-recipe is part of a conda-forge feedstock and includes all the instructions to create a conda-package. A recipe is a simple directory containing a `meta.yaml` file which includes all the specifications of a library like name, version, dependencies, test-specifications, license. More difficult libraries (like most of the FreeeCAD-dependencies) will also contain a `build.sh`-file for unix and `bld.bat`-file for windows. Both are scripts which contain instructions for the compilation (like calling cmake, make, ...)
To build a conda-recipe, simple call `conda build . -m .ci_support/<plattform_and_version_specific_file>.yaml`. If no such _plattform_and_version_specific_file_ is available, you can also call `conda build` without this option. (But then conda build will try to build all the supported dependency-trees. For example this will result in packages which are dependent on different python versions. (This can be prevente by using eg.: `conda build . --python=3.7`

To setup a system to work correctly with conda-build some installations are mandatory:

## OSX:

1. Download the MacOSX10.9.sdk https://github.com/phracker/MacOSX-SDKs/releases/download/10.13/MacOSX10.9.sdk.tar.xz
2. Extract files to /opt/MacOSX10.9.sdk
3. add a file in the user-home-directory named `conda-build-config.yaml` containing these lines:
```
CONDA_BUILD_SYSROOT:  
      - /opt/MacOSX10.9.sdk        # [osx]
```

## Linux:

For linux the simplest way to create a conda-package locally is docker.

- [install Docker](https://docs.docker.com/engine/installation/linux/ubuntu/) for ubuntu. But there also installation-guides for other distros available.

- conda-forge docker image:

```
sudo docker run -i -t -v ~/projects/:/home/conda/projects  --name conda-forge condaforge/linux-anvil-comp7
/usr/bin/sudo yum install -y mesa-libGL-devel
conda update --all
```

> -v: mount a local path into the docker host
> -i: Keep STDIN open even if not attached
> -t: Allocate a pseudo-TTY


## reuse container
```
sudo docker stop <name>
sudo docker start <name> -i
```

## remove all containers
```
sudo docker stop $(sudo docker ps -a -q)
sudo docker rm $(sudo docker ps -a -q)
```

## copy files to local host
```
sudo docker cp <name of running docker>:<file> <local_file_path>
```

# Build conda packages with windows

https://conda-forge.org/docs/buildwin.html


# create a new recipe

 [instruction](http://docs.anaconda.org/using.html)
- [meta.yaml](http://conda.pydata.org/docs/building/meta-yaml.html)
- build.sh (linux, mac)
- build.bat (windows)



# additional informations

- export enviroment
To create a reproduceable enviroment, we can create a yaml-file containing all the information of the packages and versions currently installed in an enviroment.
```
conda env export > environment.yml
```
http://conda.pydata.org/docs/using/envs.html#share-an-environment

- encrypted home directory:
this makes problems with building because the resulting path-length gets too long. The solution is to make a temporary build dir, e.g. mkdir /tmp/fcbuild and then append --croot /tmp/fcbuild to your conda build command.
https://github.com/conda/conda-build/issues/1331
https://forum.freecadweb.org/viewtopic.php?f=10&t=12534&start=280#p155440

- hosting packages

We host packages on https://anaconda.org/freecad.
- set enviroment variables
  - [how-to-set-specific-environment-variables](http://stackoverflowstackoverflow.com/questions/31598963/how-to-set-specific-environment-variables-when-activating-conda-environment)
  - [saved-environment-variables](http://conda.pydata.org/docs/using/envs.html#saved-environment-variables)


- update
```
conda update --all
conda update conda
```

- [enviroment variables](http://conda.pydata.org/docs/building/environment-vars.html)


- uploading sometimes needs a login:
```
anaconda login
```

- local packages:
building packages make them locally (on the machine which build the package) available. For example if the package __simage__ was build, conda will use this package. It's also possible to use a cloud service to store packages. This is very useful if you want to use your packages on multiple machines. There are two things to remember:

  1. the directory structure should be the same as in conda/conda-bld
For linux-64 it looks like this.
```
├──conda-packages
│   ├── linux-64
│   │   ├── coin3d-4.0.0-5.tar.bz2
```
  2. use `conda index conda-packages/linux-64` to add newly added packages to the conda index.
