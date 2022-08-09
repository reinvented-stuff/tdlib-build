#!/bin/bash
#
# TDLib dependencies for rhel7
#

set -e

echo "Start installing dependencies"

sudo yum install -y centos-release-scl-rh epel-release
sudo yum install -y devtoolset-9-gcc devtoolset-9-gcc-c++
sudo yum install -y gcc-c++ make git zlib-devel openssl-devel php gperf cmake3

echo "Finished installing dependencies"
