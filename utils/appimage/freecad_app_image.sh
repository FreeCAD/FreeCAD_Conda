mkdir -p FreeCAD-x86_64.AppImage/freecad.AppDir
cd FreeCAD-x86_64.AppImage/
wget -q https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh

cd freecad.AppDir
HERE=$(dirname $(readlink -f "${0}"))

bash ../Miniconda3-latest-Linux-x86_64.sh -b -p ./conda
rm ../Miniconda3-latest-Linux-x86_64.sh
PATH="${HERE}"/conda/bin:$PATH
conda config --add channels conda-forge
conda config --add channels freecad
conda create -n freecad freecad python=3.5 -y

cd ..


cp ${HERE}/conda/envs/freecad/data/freecad-icon-64.png .

cat > ./AppRun <<\EOF
#!/bin/sh
HERE=$(dirname $(readlink -f "${0}"))
export PATH="${HERE}"/miniconda3/bin:$PATH
source activate freecad
FreeCAD
EOF

chmod a+x ./AppRun


cat > ./FreeCAD.desktop <<\EOF
[Desktop Entry]
Name=FreeCAD
Icon=freecad-icon-64
Exec=FreeCAD %u
Categories=CAD;
StartupNotify=true
EOF