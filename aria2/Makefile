include $(TOPDIR)/rules.mk

PKG_NAME:=aria2
PKG_VERSION:=1.35.0
PKG_RELEASE:=2021.02.19
PKG_INSTALL:=1
STRIP:=true

include $(INCLUDE_DIR)/package.mk

define Package/$(PKG_NAME)
	SECTION:=net
	CATEGORY:=Network
	SUBMENU:=File Transfer
	TITLE:=lightweight download utility
	URL:=https://github.com/P3TERX/Aria2-Pro-Core
	DEPENDS:=+bash +curl +findutils +jq
	USERID:=aria2=6800:aria2=6800
endef

define Package/$(PKG_NAME)/description
	aria2 static builds for GNU/Linux with custom patches.
	utility
endef

ifeq ($(ARCH),i386)
	PKG_ARCH_ARIA2:=i386
endif

ifeq ($(ARCH),x86_64)
	PKG_ARCH_ARIA2:=amd64
endif

ifeq ($(ARCH),aarch64)
	PKG_ARCH_ARIA2:=arm64
endif


PKG_SOURCE:=aria2-$(PKG_VERSION)-static-linux-$(PKG_ARCH_ARIA2).tar.gz
PKG_SOURCE_URL:=https://github.com/P3TERX/aria2-builder/releases/download/$(PKG_VERSION)_$(PKG_RELEASE)/
UNTAR_DIR:=$(BUILD_DIR)/$(PKG_NAME)
PKG_HASH:=skip

define Build/Prepare
	mkdir -vp $(UNTAR_DIR)
	tar -zxvf $(DL_DIR)/$(PKG_SOURCE) -C $(UNTAR_DIR)
endef

define Package/aria2/conffiles
/etc/config/aria2
endef

define Package/$(PKG_NAME)/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(UNTAR_DIR)/aria2c $(1)/usr/bin
	chmod 755 $(1)/usr/bin/aria2c

	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_BIN) ./files/aria2.init $(1)/etc/init.d/aria2

	$(INSTALL_DIR) $(1)/etc/config
	$(INSTALL_CONF) ./files/aria2.conf $(1)/etc/config/aria2
endef

$(eval $(call BuildPackage,$(PKG_NAME)))
