# this is repo uses a modified version of openfortivpn !!!!


# openwrt-openfortivpn
OpenWRT package for [openfortivpn: A Fortinet (and Ruijie) compatible client for PPP+SSL VPN tunnel services](https://github.com/adrienverge/openfortivpn)

## Build
Example for ar71xx and trunk.
```
wget https://downloads.openwrt.org/releases/22.03.0/targets/ramips/mt7621/openwrt-sdk-22.03.0-ramips-mt7621_gcc-11.2.0_musl.Linux-x86_64.tar.xz
tar jxf OpenWrt-SDK-ar71xx-generic_gcc-4.8-linaro_musl-1.1.11.Linux-x86_64.tar.bz2
cd openwrt-sdk-22.03.0-ramips-mt7621_gcc-11.2.0_musl.Linux-x86_64/package
git clone https://github.com/dsl400/openwrt-mt7621-openfortivpn openfortivpn
cd ..
./scripts/feeds update base
./scripts/feeds install libopenssl resolveip ppp
make package/openfortivpn/compile V=s
```
