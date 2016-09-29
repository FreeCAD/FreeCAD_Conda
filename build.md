# markdown
[instruction](https://github.com/adam-p/markdown-here/wiki/Markdown-Cheatsheet)


# create package
[instruction](http://docs.anaconda.org/using.html)

## files
- [meta.yaml](http://conda.pydata.org/docs/building/meta-yaml.html)
- build.sh (linux, mac)
- build.bat (windows)

## building
conda config --set anaconda_upload no
conda build .

## uploading
at the end of the build process the upload command is printed...

## enviroment variables
- [env_var](http://conda.pydata.org/docs/building/environment-vars.html)

# autocomplete:
conda install argcomplete
eval "$(register-python-argcomplete conda)"

## list all enviroments
conda info --envs




# BUILD instruction:
## to build on debain jessie install the following files: (not working right now!)
- freeglut3.dev (opengl stufff)
- g++
- sudo ln -s /usr/lib/x64... /usr/lib64/ (has to be done!)

## to build on ubuntu 14.04:
- build-essential
- xorg-dev
- freeglut3.dev (opengl stufff)
- g++
- sudo ln -s /usr/lib/x64... /usr/lib64/ (has to be done!)