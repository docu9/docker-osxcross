#!/bin/bash
echo "START BUILD COIN"

FOLDER=/src/${COIN}-${BRANCH}-${HOST}
# remove prev src
# remove all branch...
rm -Rf /src/${COIN}-*-${HOST}

echo repo: ${REPO} branch: ${BRANCH}, target: ${FOLDER}

echo "git clone ${REPO} -b ${BRANCH} ${FOLDER} --depth=1 "
git clone ${REPO} -b ${BRANCH} ${FOLDER} --depth=1
echo "GIT CLONE SUCCESS"


cd ${FOLDER}

echo " ${HOST} " 
echo "autogen..."
./autogen.sh
echo ""
echo ""
echo "configure..."

echo " ./configure  --cache-file=config.cache --prefix=/yangcoin/depends/${HOST} \
    LDFLAGS=\" -static-libstdc++ -fPIC\"  \
    --disable-bench \
    --disable-gui-tests \
    --enable-reduce-exports \
    --with-gui \
    --with-pic \
    --enable-static \
    --disable-share \
    ${BITCOIN_CONFIG_ALL} ${BITCOIN_CONFIG}
"
./configure  --cache-file=config.cache --prefix=/yangcoin/depends/${HOST} \
    LDFLAGS=" -static-libstdc++ -fPIC"  \
    --disable-bench \
    --disable-gui-tests \
    --enable-reduce-exports \
    --with-gui \
    --with-pic \
    --enable-static \
    --disable-share \
    ${BITCOIN_CONFIG_ALL} ${BITCOIN_CONFIG}

echo ""
echo ""
echo ""
echo ""
echo ""
echo "make -j4"
make -j4

echo ""
echo ""
echo ""
echo ""
echo ""
echo ""
echo "build after"
/sh/after.sh
