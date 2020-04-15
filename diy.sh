#!/bin/bash
#=================================================
# Description: DIY script
# Lisence: MIT
# Author: P3TERX
# Blog: https://p3terx.com
#=================================================

# Modify default IP
sed -i 's/192.168.1.1/192.168.123.2/g' package/base-files/files/bin/config_generate

# 删除默认密码
sed -i "/CYXluq4wUazHjmCDBCqXF/d" package/lean/default-settings/files/zzz-default-settings

# 添加软件包
## fq
git clone https://github.com/Lienol/openwrt-package package/lienol
git clone https://github.com/vernesong/OpenClash package/openclash
git clone https://github.com/jefferymvp/luci-app-koolproxyR package/koolproxyR
git clone https://github.com/frainzy1477/luci-app-clash package/clash
## services
git clone https://github.com/rufengsuixing/luci-app-adguardhome package/adguardhome
git clone https://github.com/tty228/luci-app-serverchan package/luci-app-serverchan
git clone https://github.com/pymumu/luci-app-smartdns.git package/luci-app-smartdns
## themes
git clone https://github.com/apollo-ng/luci-theme-darkmatter.git package/luci-theme-darkmatter
git clone https://github.com/Leo-Jo-My/luci-theme-opentomato.git package/luci-theme-opentomato
git clone https://github.com/openwrt-develop/luci-theme-atmaterial package/luci-theme-atmaterial


#更改时区
sed -i "s/'UTC'/'CST-8'\n        set system.@system[-1].zonename='Asia\/Shanghai'/g" package/base-files/files/bin/config_generate

./scripts/feeds update -a
./scripts/feeds install -a
