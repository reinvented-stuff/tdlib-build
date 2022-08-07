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
cmake --build . --target prepare_cross_compiling

cd ..
php SplitSource.php

cd build
cmake --build . --target install

cd ..
php SplitSource.php --undo

cd ..
ls -l td/tdlib

echo "Finished building"
