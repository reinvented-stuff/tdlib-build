#!/bin/bash
#
# TDLib dependencies for rhel8
#

set -e

echo "Start installing dependencies"

sudo dnf --enablerepo=powertools install -y gperf
sudo yum install -y gcc-c++ make git zlib-devel openssl-devel php cmake

echo "Finished installing dependencies"
