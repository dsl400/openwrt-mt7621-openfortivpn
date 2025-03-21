include $(TOPDIR)/rules.mk

PKG_NAME:=openfortivpn
PKG_VERSION:=1.23.1
PKG_RELEASE:=1
PKG_LICENSE:=GPLv3
PKG_LICENSE_FILES:=LICENSE

# Use your repository and branch/commit
PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=https://github.com/dsl400/openfortivpn.git
PKG_SOURCE_VERSION:=0d88399386d3736a66836ba9181419900a84c736  # Replace with the correct commit hash if necessary
PKG_SOURCE_SUBDIR:=$(PKG_NAME)-$(PKG_VERSION)
PKG_SOURCE:=$(PKG_SOURCE_SUBDIR).tar.gz

include $(INCLUDE_DIR)/package.mk

define Package/openfortivpn
  SECTION:=net
  CATEGORY:=Network
  TITLE:=A Fortinet compatible client for PPP+SSL VPN tunnel services
  URL:=https://github.com/adrienverge/openfortivpn
  SUBMENU:=VPN
  DEPENDS:=+libopenssl +resolveip +ppp 
endef

define Build/Compile
		cd $(PKG_BUILD_DIR) && ./autogen.sh
		cd $(PKG_BUILD_DIR) && ./configure --prefix=/usr/local --sysconfdir=/etc
		$(MAKE) -C $(PKG_BUILD_DIR) \
		$(TARGET_CONFIGURE_OPTS) \
		CFLAGS="$(TARGET_CFLAGS)" \
		INSTALL_PROG=":"
endef

define Package/openfortivpn/install
	$(INSTALL_DIR) $(1)/usr/sbin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/openfortivpn $(1)/usr/sbin/
endef

$(eval $(call BuildPackage,openfortivpn))
