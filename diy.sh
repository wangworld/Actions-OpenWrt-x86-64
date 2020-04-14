#!/bin/bash
#=================================================
# Description: DIY script
# Lisence: MIT
# Author: P3TERX
# Blog: https://p3terx.com
#=================================================
# Modify default IP
sed -i 's/192.168.1.1/192.168.123.2/g' package/base-files/files/bin/config_generate
# 添加软件包
git clone https://github.com/Lienol/openwrt-package package/lienol
git clone https://github.com/vernesong/OpenClash package/openclash
git clone https://github.com/jefferymvp/luci-app-koolproxyR package/koolproxyR
git clone https://github.com/rufengsuixing/luci-app-adguardhome package/adguardhome
git clone https://github.com/frainzy1477/luci-app-clash package/clash

./scripts/feeds update -a
./scripts/feeds install -a
