#!/bin/bash
#
# TDLib dependencies for macos-13
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


echo "Post-install actions for openssl"

cat << EOOFF >> ~/.zshrc
export PATH="/opt/homebrew/opt/openssl@3/bin:$PATH"
export LDFLAGS="-L/opt/homebrew/opt/openssl@3/lib"
export CPPFLAGS="-I/opt/homebrew/opt/openssl@3/include"
export PKG_CONFIG_PATH="/opt/homebrew/opt/openssl@3/lib/pkgconfig"
export OPENSSL_ROOT_DIR=/opt/homebrew/opt/openssl@3
EOOFF

echo "Finished installing dependencies"
