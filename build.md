# Building FreeCAD and dependencies with conda

With conda only the most general dependencies are used from the system. Therefor nearly all dependencies of FreeCAD have to be build.
Conda-Forge is a github-organization containing many dependencies of FreeCAD. With this channel added to the condarc channels section the number of packages we have to maintain for freecad is not that high. Packages which are not part of conda-forge are:

- coin3d
- netgen
- pivy
- pyside-tools

Packages are currently build with a virtual machine running ubuntu-14.04. Building them needs a virgin enviroment.
Instead of using a virtual machine, it's also possible to use docker.


## Build packages for FreeCAD with docker

### linux
- [install Docker](https://docs.docker.com/engine/installation/linux/ubuntu/) for ubuntu. But there also installation-guides for other distros available.
- to activate/create? the docker image run the following command:  
```sudo docker run -i -t continuumio/miniconda /bin/bash```
-i: Keep STDIN open even if not attached  
-t: Allocate a pseudo-TTY
- [docker conda image](https://github.com/ContinuumIO/docker-images/tree/master/miniconda#usage):
the docker image for conda is based on a debian8.5 docker image and adds some packages with the package manager. For FreeCAD we need to add some more gui-relavant packages from the package-manager apt.
  - freeglut3
  - build-essential (use conda gcc?)  

## use directories from the local host:
to use data from the local host, you can use dockers [data-volumne](https://docs.docker.com/engine/tutorials/dockervolumes/) option. This is done by adding the -v option:
```-v + path on local host:path to mount:read/write``` eg.:
- ```sudo docker run -v ~/projects/:/projects:ro  -i -t --name miniconda continuumio/miniconda /bin/bash```  

### reuse container
```
sudo docker stop <name>
sudo docker start <name> -i
```

### remove containers
```
sudo docker stop $(sudo docker ps -a -q)
sudo docker rm $(sudo docker ps -a -q)
```


## create docker image for freecad and dependencies for reproduceable containers

Once this is setup we can use this container to use for packages

- create a docker-image
```
cd FreeCAD_Conda/fc_conda_docker
docker build -t fc_conda_docker .
```

```
sudo docker run -v ~/projects/:/projects:ro -i -t --name freecad fc_conda_docker /bin/bash
```
----->
# TESTING AND DEBUGGING FreeCAD with dependencies from conda
This section is for testing new branches, or your own implementations/additions of Freecad with conda. This is nice, because conda gives us a nice way to gather all the sources we need to build FreeCAD. No need to download all the necessary libraries which have conflicts all over. Simple use the develop branch of this repo and follow this instruction:


- git clone https://github.com/looooo/FreeCAD_Conda # this branch
- go to *FreeCAD_Conda/.FreeCAD_debug/build.sh* and modify the FREECAD_SOURCE Variable at the top of the document

- in the terminal go to *FreeCAD_Conda/.FreeCAD_debug/*
- ```conda build . --python=3.5  # or 2.7```

when you have an error you can go to the build directory something like
~/miniconda3/conda-bld/FreeCAD_123423342/work
- ```source activate .``` # to activate the build enviroment
- ```make``` # to build again

you can also use the __--dirty__ flag but this will run cmake again, so there are more things getting rebuild
in the build directory you can also use cmake-gui.

# additional informations
### list all enviroments
```conda info --envs``

### update
- ```conda update --all```
- ```conda update conda```

### uploading sometimes needs a login:
```anaconda login```


<-------------

# create package
[instruction](http://docs.anaconda.org/using.html)

## files
- [meta.yaml](http://conda.pydata.org/docs/building/meta-yaml.html)
- build.sh (linux, mac)
- build.bat (windows)

## building
```conda build .```

## uploading
at the end of the build process the upload command is printed.
with -u a specific user/organization can be specified

# autocomplete:
```
conda install argcomplete
eval "$(register-python-argcomplete conda)"
```

## list all enviroments
conda env list

## enviroment variables
- [env_var](http://conda.pydata.org/docs/building/environment-vars.html)

## set enviroment variables
- [how-to-set-specific-environment-variables](http://stackoverflowstackoverflow.com/questions/31598963/how-to-set-specific-environment-variables-when-activating-conda-environment)  
- [saved-environment-variables](http://conda.pydata.org/docs/using/envs.html#saved-environment-variables)

## export enviroment
To create a reproduceable enviroment, we can create a yaml-file containing all the information of the packages and versions currently installed in an enviroment.
```
conda env export > environment.yml
```
http://conda.pydata.org/docs/using/envs.html#share-an-environment

# BUILD instruction:
## to build on ubuntu 14.04.5:
```
sudo apt-get install build-essential xorg-dev freeglut3.dev g++ cmake
sudo apt-get remove tcl tk tcl8.6 libtcl8.6
```

# remember:
- use gcc4.8 to avoid boost conflicts!!!

# encrypted home directory:
this makes problems with building because the resulting path-length gets too long. The solution is to make a temporary build dir, e.g. mkdir /tmp/fcbuild and then append --croot /tmp/fcbuild to your conda build command.  
https://github.com/conda/conda-build/issues/1331  
https://forum.freecadweb.org/viewtopic.php?f=10&t=12534&start=280#p155440

## hosting packages
We host packages on https://anaconda.org/freecad.
