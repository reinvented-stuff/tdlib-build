#!/bin/bash
#
# TDLib dependencies for macos-12
#

set -e

echo "Start installing dependencies"

if xcode-select --install; then
	echo "xcode successfully installed"
else
	echo "xcode is probably already there. not taking any more effort to verify what has happened"
fi

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew install gperf cmake openssl

echo "Finished installing dependencies"
