# Building FreeCAD and dependencies with conda

With conda only the most general dependencies are used from the system. Therefor nearly all dependencies of FreeCAD have to be build.
Conda-Forge is a github-organization containing many dependencies of FreeCAD. With this channel added to the condarc channels section the number of packages we have to maintain for freecad is not that high. Packages which are not part of conda-forge are:

- coin3d
- netgen
- pivy
- pyside-tools
- libMed

Packages are currently build with a virtual machine running ubuntu-14.04. Building them needs a virgin enviroment.
Instead of using a virtual machine, it's also possible to use docker.


# Build packages for FreeCAD with docker

## linux
- [install Docker](https://docs.docker.com/engine/installation/linux/ubuntu/) for ubuntu. But there also installation-guides for other distros available.
- conda-forge docker image:

```
sudo docker run -i -t -v ~/projects/:/projects  --name conda-forge condaforge/linux-anvil
yum install -y libXt-devel libXmu-devel libXi-devel mesa-libGLU-devel
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

- there is also the option to use a newer linux version. see fc_conda_docker/debian_based.

# TESTING AND DEBUGGING FreeCAD with dependencies from conda
This section is for testing new branches, or your own implementations/additions of Freecad with conda. This is interesting, because conda gives us a nice way to gather all the sources we need to build FreeCAD. No need to download all the necessary libraries which have conflicts all over. Simple use the develop branch of this repo and follow this instruction.

- ```git clone https://github.com/looooo/FreeCAD_Conda # this branch```
- go to *FreeCAD_Conda/.FreeCAD_debug/build.sh* and modify the FREECAD_SOURCE Variable at the top of the document

- in the terminal go to *FreeCAD_Conda/.FreeCAD_debug/*
- ```conda build . --python=3.5  # or 2.7```

when you have an error you can go to the build directory something like
~/miniconda3/conda-bld/FreeCAD_123423342/work
- ```source activate . # to activate the build enviroment```
- ```make # to build again```

you can also use the __--dirty__ flag but this will run cmake again, so there are more things getting rebuild
in the build directory you can also use cmake-gui.

# create a new recipe

 [instruction](http://docs.anaconda.org/using.html)
- [meta.yaml](http://conda.pydata.org/docs/building/meta-yaml.html)
- build.sh (linux, mac)
- build.bat (windows)

## building
```
conda build .
```

## uploading
at the end of the build process the upload command is printed.
with -u a specific user/organization can be specified
```
anaconda upload <file> -u <user_name>
```  
to use anaconda the anaconda-client has to be installed:
```
conda install anaconda-client
```

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

- autocomplete:
```
conda install argcomplete
eval "$(register-python-argcomplete conda)"
```

- [enviroment variables](http://conda.pydata.org/docs/building/environment-vars.html)


- uploading sometimes needs a login:
```
anaconda login
```
