#!/bin/bash

OPENWRT_VERSION=""

if [ ! -z "$1" ]; then
	OPENWRT_VERSION="$1"
fi

# Bump go version for xtls-core (always use latest)
# if [[ "${OPENWRT_VERSION}" =~ ^24\..+$ ]]; then
#   rm -rf feeds/packages/lang/golang
#   git clone https://github.com/o0k1/openwrt-packages-lang-golang -b coolsnowwolf-master feeds/packages/lang/golang
# fi

# Set Rust build arg llvm.download-ci-llvm to false.
# Thanks to https://github.com/Shuery-Shuai/ImmortalWrt-BPI-R4-Firmware/commit/17bffb5b345fb04be81a6a3632b5c341607172fc
sed -i 's/--set=llvm\.download-ci-llvm=true/--set=llvm.download-ci-llvm=false/' feeds/packages/lang/rust/Makefile

# Add missing dependencies for luci-app-passwall2
if [[ -d package/passwall2 ]]; then
    mkdir -p package/passwall2/dependencies

    mkdir -p package/passwall2/dependencies/tcping
    wget https://github.com/immortalwrt/packages/raw/refs/heads/master/net/tcping/Makefile -O passwall2/dependencies/tcping/Makefile

    mkdir -p feeds/packages/net/geoview # Force relative path with lang/golang or build will fail
    wget https://github.com/immortalwrt/packages/raw/refs/heads/master/net/geoview/Makefile -O feeds/packages/net/geoview/Makefile
    ln -s ../../../feeds/packages/net/geoview package/passwall2/dependencies/geoview
fi
