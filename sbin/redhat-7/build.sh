#!/bin/bash
#
# TDLib dependencies for rhel7
#

set -e

echo "Start building"

cd td

rm -vrf build
mkdir build

cd build

CC=/opt/rh/devtoolset-9/root/usr/bin/gcc CXX=/opt/rh/devtoolset-9/root/usr/bin/g++ cmake3 -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX:PATH=../tdlib ..
cmake3 --build . --target prepare_cross_compiling

cd ..
php SplitSource.php

cd build
cmake3 --build . --target install -- -j 4

cd ..
php SplitSource.php --undo

cd ..
ls -l td/tdlib

echo "Finished building"
