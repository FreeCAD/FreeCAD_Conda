## INSTALL MINICONDA:

- first get miniconda: http://conda.pydata.org/miniconda.html choose python3 (it's not necessary, you could also choose python2, but then it will download python3 stuff in the "create-env-step")
- install miniconda: bash <miniconda-file>.sh (not as root!!!)
- at the end of the install it will ask you if you want to add the anaconda-dir to the $PATH, say yes.
- if you do not want anaconda to be the default python open the ~/.bashrc and edit the new line:
    -from this: __export PATH="path_to_anaconda/bin:$PATH"__
    -to this: __alias initConda='export PATH="path_to_anaconda/bin:$PATH" '__   
    this way anaconda isn't perpended by default. As soon as you call "initConda" python will be the anaconda version.

## CREATE A NEW ENV

- type in terminal: __initConda__ (now the "conda" command should be available)
- create an env: __conda create -n env-name python=3.5__ # with <env-name> is the name of the env, eg. fc_test
    (it will install some packages, but I think most of them are available within miniconda, so it will only link this packages to the env)
- at the end of this process a short statement is printed how to activate the new env.: source activate <env-name>
- now you have a minimal setup of python (only packages in this env are available)


## INSTALL FREECAD

- first we have to add some channels to get all the necesarry packages:
  - you can add them one by one with: conda config --add channels <name>
  - or you can open the ~/.condarc and add them directly to this file
at the end this file should look like this:

```
channels:
  - spyder-ide
  - defaults
  - freecad
```

 - the channels hosting this libraries:
    - looooo: freecad, coin, pivy, boost,...
    - dlr-sc: oce
    - spyder-ide: libuci

- install freecad: __conda install freecad__
- start freecad: FreeCAD

If you had freecad previously on your machine this will maybe work. otherwise there will be errors about missing libraries. Please report this and search if the missing packages are available on anaconda.org.
