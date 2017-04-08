
cd ARPACK
sh ./fixhome.sh
make lib

cd ..
cd SPOOLES.2.2
make lib -f makefile_MT

cd ..
cd CalculiX/ccx_2.12/src;
make -f Makefile_MT

cp ccx_2.12_MT $PREFIX/bin/ccx
cd $SRC_DIR