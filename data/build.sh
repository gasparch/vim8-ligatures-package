#!/bin/bash

CWD=$(dirname $(readlink -f $0))
INSTALL_PATH=/opt/vim8-ligatures

if [ "$1" = "" ]; then
  STAGES="cleanall fetch copysrc configure make install pack cleanup"
else
  STAGES=$@
fi

cd $CWD
case $STAGES in
  *cleanall*)
    rm -rf $CWD/build
    mkdir -p $CWD/build
esac

cd $CWD
case $STAGES in
  *fetch*)
    rm -rf $CWD/build/src/
    git clone --depth 1 https://github.com/vim/vim.git $CWD/build/src/
    cd $CWD/build/src
    patch -p1 < $CWD/ligatures.patch
esac

cd $CWD
case $STAGES in
  *copysrc*)
    rm -rf $CWD/build/build
    cp -R $CWD/build/src $CWD/build/build
esac

cd $CWD
case $STAGES in
  *configure*)
    cd $CWD/build/build

    ./configure --enable-multibyte --enable-pythoninterp=dynamic --with-python-config-dir=/usr/lib/python2.7/config-x86_64-linux-gnu --enable-python3interp --with-python3-config-dir=/usr/lib/python3.5/config-3.5m-x86_64-linux-gnu --enable-cscope --enable-gui=gtk3 --with-features=huge --with-x --enable-fontset --enable-largefile --disable-netbeans --enable-fail-if-missing --prefix=$INSTALL_PATH
esac


cd $CWD
case $STAGES in
  *make*)
    cd $CWD/build/build
    make -j `nproc`
esac


cd $CWD
case $STAGES in
  *test*)
    cd $CWD/build/build
    make test || (echo "tests failed"; exit 10)
esac

cd $CWD
case $STAGES in
  *install*)
    rm -rf $INSTALL_PATH $CWD/build/install
    cd $CWD/build/build/src
    make install

    mv $INSTALL_PATH $CWD/build/install
esac


cd $CWD
case $STAGES in
  *pack*)
    rm -rf /opt
    mkdir /opt

    MAJOR_VERSION=`$CWD/build/install/bin/vim --version | head -n1 | grep -o '[0-9]\.[0-9]'`
    PATCH_LEVEL=`$CWD/build/install/bin/vim --version | head -n2 | grep -o -- '-[0-9]\+' | cut -b2-`

    checkinstall -D -y --pkgname=vim8-ligatures --pkgversion="$MAJOR_VERSION.$PATCH_LEVEL" --pkggroup="Editors" --pkgsource="https://github.com/vim/vim.git" --nodoc cp -R $CWD/build/install/ $INSTALL_PATH
esac

cd $CWD
case $STAGES in
  *cleanup*)
    rm -rf $CWD/description-pak 
    rm -rf $CWD/build
esac
