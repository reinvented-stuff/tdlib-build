#!/bin/bash
#
# TDLib dependencies for Docker build on macos-13
#

set -e

echo "Start installing dependencies for Docker build"

if xcode-select --install; then
	echo "xcode successfully installed"
else
	echo "xcode is probably already there. not taking any more effort to verify what has happened"
fi

echo "Downloading Docker package"
curl -o /tmp/Docker.dmg -Ls https://desktop.docker.com/mac/main/arm64/Docker.dmg

echo "Installing Docker"
hdiutil attach /tmp/Docker.dmg
/Volumes/Docker/Docker.app/Contents/MacOS/install
hdiutil detach /Volumes/Docker

if docker --version; then
	echo "Docker seems to be installed and ready to use"
else
	echo "Error installing docker" >&2
	exit 2
fi

echo "Finished installing dependencies for Docker build"
