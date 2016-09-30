## INSTALL MINICONDA:

- first get miniconda: http://conda.pydata.org/miniconda.html choose python3 (it's not necessary, you could also choose python2 but you can have a python2 env anyway)
- install miniconda: bash <miniconda-file>.sh (not as root!!!)
- at the end of the install it will ask you if you want to add the anaconda-dir to the $PATH, say yes.
- if you do not want anaconda to be the default python open the ~/.bashrc and edit the new line:
    -from this: __export PATH="path_to_anaconda/bin:$PATH"__
    -to this: __alias initConda='export PATH="path_to_anaconda/bin:$PATH" '__
    this way anaconda isn't perpended by default. As soon as you call "initConda" python will be the anaconda version.



## INSTALL FREECAD

- first we have to add some channels to get all the necesarry packages:
  - you can add them one by one with: conda config --add channels <name>
  - or you can open the ~/.condarc and add them directly to this file
at the end this file have to look like this.
__open ~.condarc with a editor and make the channels section look like this__

```
channels:
  - conda-forge
  - defaults
  - freecad
```

 - the channels hosting this libraries:
    - freecad: freecad, coin, pivy, boost, occt, ...
    - conda-forge: pyside, shiboken, ...



### CREATE A NEW ENV
- type in terminal: __initConda__ (now the "conda" command should be available)
- create an env: __conda create -n env-name freecad__ # with <env-name> is the name of the env, eg. fc_test
    (this will install all necessary packages needed to run FreeCAD)
- at the end of this process a short statement is printed how to activate the new env.: source activate <env-name>

- start freecad: FreeCAD

Most likely there will be some library linking errors... If you encounter one of these, pleasecreate a new issue at: https://github.com/looooo/FreeCAD_Conda/issues
