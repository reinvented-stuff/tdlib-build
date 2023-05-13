#!/bin/bash
#
# TDLib dependencies for Docker build on macos-13
#

set -e

log(){
	echo "[$(date +"%F %T")] $*"
}

log "Start installing dependencies for Docker build"

if xcode-select --install; then
	log "xcode successfully installed"
else
	log "xcode is probably already there. not taking any more effort to verify what has happened"
fi

log "Downloading Docker package"
curl -o /tmp/Docker.dmg -Ls https://desktop.docker.com/mac/main/arm64/Docker.dmg

log "Attaching Docker.dmg"
hdiutil attach /tmp/Docker.dmg

log "Installing Docker"
/Volumes/Docker/Docker.app/Contents/MacOS/install

log "Starting Docker desktop"
open -a Docker

log "Workaroundig probably missing PATH section"
export PATH="/usr/local/bin:${PATH}"

log "Verifying docker binary is there"
if which docker; then
	log "Found docker binary"
else
	log "Nothing found, that's probably bad"
fi

log "Waiting for docker ps to work"
MAX_ATTEMPTS=5
CURRENT_ATTEMPT=0
DELAY_SEC=2
DOCKER_CHECK_RC=1

while [[ "${CURRENT_ATTEMPT}" < "${MAX_ATTEMPTS}" ]]; do

	CURRENT_ATTEMPT=$(( CURRENT_ATTEMPT + 1 ))

	log "Attempt ${CURRENT_ATTEMPT} executing docker ps"

	if docker ps; then
		log "Docker daemon is up and running"
		DOCKER_CHECK_RC=0
		break
	else
		log "Docker daemon doesn't seem to be up (sleep ${DELAY_SEC} sec.)"
		sleep "${DELAY_SEC}"	
	fi
done

if [[ "${DOCKER_CHECK_RC}" != 0 ]]; then 
	log "Error probing Docker daemon: MAX_ATTEMPTS=${MAX_ATTEMPTS} CURRENT_ATTEMPT=${CURRENT_ATTEMPT}"
	exit "${DOCKER_CHECK_RC}"
fi

log "Detaching Docker.dmg"
hdiutil detach /Volumes/Docker

if docker --version; then
	log "Docker seems to be installed and ready to use"
else
	log "Error installing docker" >&2
	exit 2
fi

log "Finished installing dependencies for Docker build"
