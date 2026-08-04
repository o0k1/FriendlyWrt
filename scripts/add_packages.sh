#!/bin/bash

## Prepare feeds file
(cd friendlywrt && {
    [ ! -f feeds.conf ] && cp feeds.conf.default feeds.conf
})

# # {{ Add luci-app-ssr-plus
# (cd friendlywrt/package && {
#     [ -d helloworld ] && rm -rf helloworld
#     git clone https://github.com/fw876/helloworld.git -b master
# })
# cat >> configs/rockchip/01-nanopi << EOF
# CONFIG_PACKAGE_luci-app-ssr-plus=y
# CONFIG_PACKAGE_luci-app-ssr-plus_Nftables_Transparent_Proxy=y
# CONFIG_PACKAGE_luci-app-ssr-plus_INCLUDE_Shadowsocks_Rust_Client=y
# CONFIG_PACKAGE_luci-app-ssr-plus_INCLUDE_Shadowsocks_Rust_Server=y
# CONFIG_PACKAGE_luci-app-ssr-plus_INCLUDE_Xray=y
# CONFIG_PACKAGE_luci-app-ssr-plus_INCLUDE_ChinaDNS_NG=y
# CONFIG_PACKAGE_luci-app-ssr-plus_INCLUDE_DNS2SOCKS=y
# CONFIG_PACKAGE_luci-app-ssr-plus_INCLUDE_MosDNS=y
# CONFIG_PACKAGE_luci-app-ssr-plus_INCLUDE_Hysteria=y
# CONFIG_PACKAGE_luci-app-ssr-plus_INCLUDE_Shadowsocks_Simple_Obfs=y
# CONFIG_PACKAGE_luci-i18n-ssr-plus-zh-cn=y
# EOF
# # }}

# {{ Add luci-app-passwall2
cat >> friendlywrt/feeds.conf << EOF
src-git passwall2 https://github.com/Openwrt-Passwall/openwrt-passwall2.git;main
src-git passwall_packages https://github.com/Openwrt-Passwall/openwrt-passwall-packages.git;main
EOF
cat >> configs/rockchip/01-nanopi << EOF
CONFIG_PACKAGE_luci-app-passwall2=y
# CONFIG_PACKAGE_luci-app-passwall2_Basic_Core_Xray is not set
# CONFIG_PACKAGE_luci-app-passwall2_Basic_Core_SingBox is not set
CONFIG_PACKAGE_luci-app-passwall2_Basic_Core_All=y
# CONFIG_PACKAGE_luci-app-passwall2_Iptables_Transparent_Proxy is not set
CONFIG_PACKAGE_luci-app-passwall2_Nftables_Transparent_Proxy=y
CONFIG_PACKAGE_luci-app-passwall2_INCLUDE_Haproxy=y
CONFIG_PACKAGE_luci-app-passwall2_INCLUDE_Hysteria=y
CONFIG_PACKAGE_luci-app-passwall2_INCLUDE_NaiveProxy=y
CONFIG_PACKAGE_luci-app-passwall2_INCLUDE_Shadowsocks_Rust_Client=y
# CONFIG_PACKAGE_luci-app-passwall2_INCLUDE_Shadowsocks_Rust_Server is not set
CONFIG_PACKAGE_luci-app-passwall2_INCLUDE_ShadowsocksR_Libev_Client=y
# CONFIG_PACKAGE_luci-app-passwall2_INCLUDE_ShadowsocksR_Libev_Server is not set
CONFIG_PACKAGE_luci-app-passwall2_INCLUDE_Simple_Obfs=y
CONFIG_PACKAGE_luci-app-passwall2_INCLUDE_V2ray_Plugin=y
CONFIG_PACKAGE_luci-i18n-passwall2-zh-cn=y
EOF
# }}

# {{ Add luci-app-vlmcsd
cat >> friendlywrt/feeds.conf << EOF
src-git vlmcsd https://github.com/o0k1/openwrt-packages-vlmcsd.git;immortalwrt-master
EOF
cat >> configs/rockchip/01-nanopi << EOF
CONFIG_DEFAULT_luci-app-vlmcsd=y
CONFIG_PACKAGE_luci-app-vlmcsd=y
CONFIG_PACKAGE_luci-i18n-vlmcsd-zh-cn=y
CONFIG_PACKAGE_vlmcsd=y
EOF
# }}
