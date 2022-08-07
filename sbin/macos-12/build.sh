#!/bin/bash
#
# TDLib dependencies for masos-12
#

set -e

echo "Start building"

cd td

rm -rf build
mkdir build

cd build
cmake -DCMAKE_BUILD_TYPE=Release -DOPENSSL_ROOT_DIR=/usr/local/opt/openssl/ -DCMAKE_INSTALL_PREFIX:PATH=../tdlib ..
cmake --build . --target install

cd ..
cd ..

ls -l td/tdlib

echo "Finished building"
