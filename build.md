# markdown
[instruction](https://github.com/adam-p/markdown-here/wiki/Markdown-Cheatsheet)


# create package
[instruction](http://docs.anaconda.org/using.html)

# remove enviroment
conda remove --name flowers --all

## files
- [meta.yaml](http://conda.pydata.org/docs/building/meta-yaml.html)
- build.sh (linux, mac)
- build.bat (windows)

## building
conda config --set anaconda_upload no
conda build .

## uploading
at the end of the build process the upload command is printed...

# autocomplete:
conda install argcomplete
eval "$(register-python-argcomplete conda)"

## list all enviroments
conda info --envs
conda env list

## enviroment variables
- [env_var](http://conda.pydata.org/docs/building/environment-vars.html)

## set enviroment variables
http://stackoverflow.com/questions/31598963/how-to-set-specific-environment-variables-when-activating-conda-environment
http://conda.pydata.org/docs/using/envs.html#saved-environment-variables

## export enviroment
```
conda env export > environment.yml
```
http://conda.pydata.org/docs/using/envs.html#share-an-environment

# BUILD instruction:
## to build on debian jessie install the following files: (not working right now!)
- freeglut3.dev (opengl stufff)
- g++
- sudo ln -s /usr/lib/x64... /usr/lib64/ (has to be done!)

## to build on ubuntu 14.04.5:
- sudo apt-get install build-essential xorg-dev freeglut3.dev g++ cmake
- sudo ln -s /usr/lib/x86_64-linux-gnu/ /usr/lib64 (has to be done!)
- sudo apt-get remove tcl tk tcl8.6 libtcl8.6
