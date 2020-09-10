#!/bin/sh

: ${PREFIX:="/usr/local"}
: ${NINJA_BIN:="${PREFIX}/bin/ninja"}

VERSION="1.7.1"
ARCH=`uname -p`
OS=`uname -s | tr '[[:upper:]]' '[[:lower:]]'`

if [ ! -z $1 ]; then
    VERSION="$1"
fi

ln -s -f ${NINJA_BIN} .

cat <<__EOF__ >package.json
{
    "description": "Ninja is a small build system with a focus on speed.",
    "name": "tool-ninja",
    "system": [
        "${OS}_${ARCH}"
    ],
    "url": "https://github.com/trombik/platformio-freebsd-tool-ninja",
    "version": "${VERSION}"
}
__EOF__
