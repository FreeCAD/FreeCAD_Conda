# Build conda paclkages with windows

- install windows 7/8/10 or run in virtual machine
    - win 7 needs service pack 1
- get visual studio 2015 https://www.microsoft.com/de-DE/download/details.aspx?id=48146
    - select the c++ things (not remember what exactly, but it were missing at first try)
    - installation will take some time
- get miniconda https://conda.io/miniconda.html
- ```conda install conda-build anaconda client git```
- ```git clone https://github.com/looooo/FreeCAD_Conda```
- cd to the recipe to build and run ```conda build . --python=3.5``` to build