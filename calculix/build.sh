
echo $SRC_DIR
curl http://www.netlib.org/linalg/spooles/spooles.2.2.tgz -o $SRC_DIR/../SPOOLES.2.2.tgz
mkdir -p $SRC_DIR/../SPOOLES.2.2
tar -xvzf $SRC_DIR/../SPOOLES.2.2.tgz -C $SRC_DIR/../SPOOLES.2.2

cd ccx_2.12/src/
make