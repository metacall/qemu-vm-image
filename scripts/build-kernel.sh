#!/bin/sh

export LTS=6.1.27
export WORKDIR=../temp

# TODO: should probably have this directory in the repo
# Create working directory
mkdir -p ${WORKDIR} && cd ${WORKDIR}

# Download latest kernel LTS release
# TODO: we should possibly get the lts version dynamically rather than hardcode it in this script
curl --progress-bar -L https://cdn.kernel.org/pub/linux/kernel/v6.x/linux-${LTS}.tar.xz -o linux-${LTS}.tar.xz

# Unpack archive
tar -xf linux-${LTS}.tar.xz
rm linux-${LTS}.tar.xz

export KCONFIG=../source/kernel/defconfig

cd linux-${LTS} && cp ../`KCONFIG` ./config

`# Configure` make localyesconfig

`# Build` make -j `getconf _NPROCESSORS_ONLN` CONFIG_LOCALVERSION_AUTO=y LOCALVERSION=-metacall-vm

`# copy` mv arch/x86/boot/bzImage ../../out
