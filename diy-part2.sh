#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#
#
#sed -i '/uci commit system/i\uci set system.@system[0].hostname='QcWrt'' package/lean/default-settings/files/zzz-default-settings
#sed -i "s/OpenWrt /Qc /g" package/lean/default-settings/files/zzz-default-settings

# 替换默认IP
#sed -i 's#192.168.1.1#192.168.1.16#g' package/base-files/files/bin/config_generate

# 添加额外软件包
#git clone https://github.com/jerrykuku/luci-app-jd-dailybonus.git package/luci-app-jd-dailybonus
#git clone https://github.com/jerrykuku/lua-maxminddb.git package/lua-maxminddb
#git clone https://github.com/jerrykuku/luci-app-vssr.git package/luci-app-vssr
#git clone https://github.com/kongfl888/luci-app-adguardhome.git package/luci-app-adguardhome
#git clone https://github.com/garypang13/luci-app-bypass package/luci-app-bypass
#git clone https://github.com/kenzok8/small-package package/small



git clone https://github.com/kenzok8/small-package package/small
cd package/small
tar -cvzf ../small.tar.gz *
cd ../
rm -rf small
cd lean
tar -xvzf ../small.tar.gz
cd ../
rm -rf small.tar.gz
cd ../
./scripts/feeds update -a
./scripts/feeds install -a

