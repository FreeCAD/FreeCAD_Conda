# Building FreeCAD and dependencies with conda

With conda only the most general dependencies are used from the system. Therefor nearly all dependencies of FreeCAD have to be build.
Conda-Forge is a github-organization containing many dependencies of FreeCAD. With this channel added to the condarc channels section the number of packages we have to maintain for freecad is not that high. Packages which are not part of conda-forge are:

- coin3d
- netgen
- pivy
- libMed
- ...


# Build packages for FreeCAD with docker

## linux
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

# building
```
conda build . -m .ci_support/<target_plattform>.yaml
```

# uploading
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
