#!/bin/sh

version=${BRANCH}
platform=`uname -a | awk '{print tolower($1)}'`


FOLDER=/src/${COIN}-${BRANCH}-${HOST}
BINNAME=${COIN}-${BRANCH}
echo "binname = ${BINNAME}" 
cd ${FOLDER}
if test "${HOST}" = "x86_64-apple-darwin11" ; then
    make deploy
    mv *.dmg /deploy/${BINNAME}-osx.dmg
elif test "${HOST}" = "x86_64-unknown-linux-gnu" ; then
    ./pack.sh
    mv *.tar.gz /deploy/${BINNAME}-linux64.tar.gz
elif test "${HOST}" = "x86_64-w64-mingw32" ; then
    make deploy
    mv *.exe /deploy/${BINNAME}-win64-setup.exe
else 
    echo "${HOST}  binary distribution not available for platform and architecture"
    exit -1
fi

rm -Rf ${FOLDER}