#!/bin/bash

OPENWRT_VERSION=""

if [ ! -z "$1" ]; then
	OPENWRT_VERSION="$1"
fi

# if [[ "${OPENWRT_VERSION}" =~ ^24\..+$ ]]; then
#   # Bump go version for xtls-core (always use latest)
#   rm -rf feeds/packages/lang/golang
#   git clone https://github.com/o0k1/openwrt-packages-lang-golang -b coolsnowwolf-master feeds/packages/lang/golang
# fi

# Set Rust build arg llvm.download-ci-llvm to false.
# Thanks to https://github.com/Shuery-Shuai/ImmortalWrt-BPI-R4-Firmware/commit/17bffb5b345fb04be81a6a3632b5c341607172fc
sed -i 's/--set=llvm\.download-ci-llvm=true/--set=llvm.download-ci-llvm=false/' feeds/packages/lang/rust/Makefile
