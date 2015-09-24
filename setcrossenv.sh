#!/bin/bash
#

 export INSTALLDIR=/home/zhangbin/nuf/nfshome/st/out
 export PATH=$INSTALLDIR/bin:$PATH
 export TARGETMACH=arm-linux-gnueabihf
 export BUILDMACH=X86_64-pc-linux-gnu
 export CROSS=arm-linux-gnueabihf
 export CC=${CROSS}-gcc
 export LD=${CROSS}-ld
 export AS=${CROSS}-as
 export AR=${CROSS}-ar

