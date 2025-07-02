# Building FreeCAD and dependencies with conda

With conda only the most general dependencies are used from the system. Because FreeCAD is specialized, we therefore need nearly all its dependencies to be built using conda.

## Background
**conda-forge** is a Github-organization that provides many dependencies in general and specifically many of the ones relevant to FreeCAD. With this channel (`freecad-conda`) added to the `condarc-channels-section` the number of packages we have to maintain for FreeCAD is not that high (thankfully!).

Most of the FreeCAD-relevant packages are now **conda-forge-feedstocks** and listed as subrepos of [FreeCAD_Conda](https://github.com/FreeCAD/FreeCAD_Conda).

All **conda-forge-feedstocks** are built automatically by Continuous Integration (CI's) for MacOSX, Linux and Windows. This way it's easy to collaborate and fix build-problems. So for example, if you encounter any problem which can be fixed by build-instructions, or if you want a newer version of a library please navigate to the corresponding feedstock, **fork** this feedstock on github and add changes. Once done create a **Pull Request** or PR (which will trigger the CI's to build) and see if the build succeeds on all platforms.

### Building Packages Remotely (with CI's)
**Conda-forge** uses build-tools from **anaconda**. These tools (such as: a compiler, build-environments, etc...) are also changing and in-flux. To keep a feedstock updated, the **conda-smithy** utility should be used. This can be easily done in a PR by following the instructions listed here: https://conda-forge.org/docs/maintainer/infrastructure.html#admin-web-services

### Building Packages Locally (sans CI's)
To build packages locally (without CI's) we use **conda-build**. conda-build is the tool to create a package from a **conda-recipe**. A conda-recipe is part of a *conda-forge feedstock* and includes all the instructions to create a *conda-package*. A recipe is a simple directory containing a `meta.yaml` file which includes all the specifications of a library like: *name*, *version*, *dependencies*, *test-specifications*, and *license*. 

More complex libraries (like most of FreeCAD's dependencies) will also contain a `build.sh` file for Linux/OSX and `bld.bat` file for Windows. Both are scripts which contain instructions for the compilation (like calling cmake, make, etc...)

**To build a conda-recipe, simply call**:  

  `conda build . -m .ci_support/<platform_and_version_specific_file>.yaml`  

If no such _platform_and_version_specific_file_ is available, you can also call `conda build` without this option. (Note: if you opt for this approach then `conda build` will try to build all the supported dependency-trees. For example this will result in packages which are dependent on different python versions. (This can be prevented by using for example:  
  
`conda build . --python=3.7`

To setup a system to work correctly with conda-build some installations are mandatory:

### MacOSX

1. Download the MacOSX10.12.sdk ([link](https://github.com/phracker/MacOSX-SDKs/releases/download/10.13/MacOSX10.12.sdk.tar.xz))
2. Extract files to `/opt/MacOSX10.12.sdk`
3. Add a file in the user home directory AKA `~/conda_build_config.yaml` containing these lines:
```yaml
CONDA_BUILD_SYSROOT:  
      - /opt/MacOSX10.12.sdk        # [osx]
```

### Linux:

For Linux the simplest way to create a conda-package locally is using [docker](https://www.docker.com/).

1. [Install Docker](https://docs.docker.com/engine/installation/linux/ubuntu/) for Ubuntu. There are also installation-guides for other distros available.
2. Install the conda-forge docker image:

  ```bash
  sudo docker run -i -t -v ~/projects/:/home/conda/projects  --name conda-forge condaforge/linux-anvil-comp7
  /usr/bin/sudo yum install -y mesa-libGL-devel
  conda update --all
  ```
  > Legend:  
  > -v: mount a local path into the docker host  
  > -i: Keep STDIN open even if not attached  
  > -t: Allocate a pseudo-TTY


#### Reuse container
```bash
sudo docker stop <name>
sudo docker start <name> -i
```

#### Remove all containers
```bash
sudo docker stop $(sudo docker ps -a -q)
sudo docker rm $(sudo docker ps -a -q)
```

#### Copy files to local host
```bash
sudo docker cp <name of running docker>:<file> <local_file_path>
```

## Build conda packages with windows
https://conda-forge.org/docs/buildwin.html


## Create a new recipe
Following these [instruction](http://docs.anaconda.org/using.html)
- [meta.yaml](http://conda.pydata.org/docs/building/meta-yaml.html)
- build.sh (linux, mac)
- build.bat (windows)


## Additional information

### Export environment
To create a reproduceable environment, we can create a `yaml` file containing all the information of the packages and versions currently installed in an environment.

```bash
conda env export > environment.yml
```
>  source: http://conda.pydata.org/docs/using/envs.html#share-an-environment

### Encrypted home directory
This creates problems with building because the resulting path-length gets too long. The solution is to make a temporary build directory, e.g.  
`mkdir /tmp/fcbuild`  
and then append  
`--croot /tmp/fcbuild` to your conda build command.
>   sources:  
>   https://github.com/conda/conda-build/issues/1331  
>   https://forum.freecad.org/viewtopic.php?f=10&t=12534&start=280#p155440

### Hosting FreeCAD packages

We host packages on **https://anaconda.org/freecad**
1. set environment variables
>  source:  
>  [how-to-set-specific-environment-variables](http://stackoverflowstackoverflow.com/questions/31598963/how-to-set-specific-environment-variables-when-activating-conda-environment)  
>  [saved-environment-variables](http://conda.pydata.org/docs/using/envs.html#saved-environment-variables)


### Update packages
```bash
conda update --all
conda update conda
```

- [environment variables](http://conda.pydata.org/docs/building/environment-vars.html)


#### Uploading sometimes needs a login:
```bash
anaconda login
```

#### Working with local packages:
Building packages, make them locally (on the machine which built the package) available. For example if the package __simage__ was built, conda will use this package. It's also possible to use a cloud service to store packages. This is very useful if you want to use your packages on multiple machines. There are two things to remember:

  1. the directory structure should be the same as in conda/conda-bld  
  For linux-64 it looks like this.
  ```bash
  ├──conda-packages
  │   ├── linux-64
  │   │   ├── coin3d-4.0.0-5.tar.bz2
  ```
  2. Use `conda index conda-packages/linux-64` to add newly added packages to the conda index.


### Maintainer info:
How to fork and run on CI's
- Fork repo (github)
- Add specific channels in `recipe/conda_build_config.yaml`
- Create or view `BINSTAR_TOKEN` @ anaconda.org
- Encrypt or add `BINSTAR_TOKEN` @ ci (circleci, appveyor)
- Add encrypted key to `conda-forge.yaml` (appveyor)
- `conda smithy rerender` and commit
- Change source (eg. your FreeCAD fork)

#### For azure:
- Wnable azure on github (marketplace, azure)
- azure login and search (google) for secret variables
- Create a `BINSTAR_TOKEN` and copy the value from anaconda.org (settings, access)
- To use azure for all platforms add the following to conda-forge.yaml in the feedstock:
```yaml
provider:
  win: azure
  osx: azure
  linux: azure
```

# TODO
* Run this by the FC community for testing and further refinments
