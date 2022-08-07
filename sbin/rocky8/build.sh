#!/bin/bash
#
# TDLib dependencies for rhel8
#

set -e

echo "Start building"

cd td

rm -vrf build
mkdir build

cd build

cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX:PATH=../tdlib ..
cmake --build . --target install

cd ..
cd ..
ls -l td/tdlib

echo "Finished building"
