cmake -DCMAKE_INSTALL_PREFIX=$PREFIX \
      -DCMAKE_PREFIX_PATH=$PREFIX .
make install -j4

cp -r ${RECIPE_DIR}/Coin ${PREFIX}/share/
cp ${SRC_DIR}/bin/coin-config ${PREFIX}/bin/