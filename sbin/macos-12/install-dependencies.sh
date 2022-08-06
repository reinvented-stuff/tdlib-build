#!/bin/bash
#
# TDLib dependencies for macos-12
#

set -e

echo "Start installing dependencies"

xcode-select --install
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew install gperf cmake openssl

echo "Finished installing dependencies"
