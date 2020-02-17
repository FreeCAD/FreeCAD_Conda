# Environment to build latest master of freecad

0. prepare your system (TODO)

## Windows
## Linux
## Mac

1. install conda (if you haven't already)
2. setup channels (if you haven't already)
`conda config --add channels conda-forge`
`conda config --add channels freecad/label/dev`
3. install necessary tools in base environment:
`conda install conda-build conda-forge-`
4. download the [freecad-feedstock](https://github.com/conda-forge/freecad-feedstock)
5. cd into the freecad-feedstock
6. run `conda debug . -m .ci_support/<target_plattform_and_python_version>.yaml`
7. Once this step is done, follow the instructions (best to copy the instructions to an editior, you want to remeber these instructions for the next time you want to compile freecad)
8. run `bash conda_build.sh` (this will start the build)
9. once done run freecad by typing `freecad`

# Further topics:
## changing the remote to a different fork of freecad
## using git to pull latest sources
