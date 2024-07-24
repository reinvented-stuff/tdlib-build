#!/bin/bash
#
# TDLib dependencies for masos-13
#

set -e

echo "Import .zshrc"
source ~/.zshrc

echo "Start building"

cd td

rm -rf build
mkdir build

cd build
cmake -DCMAKE_BUILD_TYPE=Release -DOPENSSL_ROOT_DIR="${OPENSSL_ROOT_DIR}" -DCMAKE_INSTALL_PREFIX:PATH=../tdlib ..
cmake --build . --target install -- -j4

cd ..
cd ..

ls -l td/tdlib

echo "Finished building"
