#!/bin/bash

root=${1:-/}

debv=$(<"${root}etc/debian_version")
debx=${debv/\.[0-9]*/}
PRETTY_NAME=""
source "${root}etc/os-release"

echo "$PRETTY_NAME"	
