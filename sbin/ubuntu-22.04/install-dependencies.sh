#!/bin/bash
#
# TDLib dependencies for ubuntu-22.04
#

set -e

echo "Start installing dependencies"

sudo apt-get install make git zlib1g-dev libssl-dev gperf php-cli cmake g++

echo "Finished installing dependencies"
