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
