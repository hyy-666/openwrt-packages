include $(TOPDIR)/rules.mk

LUCI_TITLE:=Network Speedlimiter
LUCI_DEPENDS:=+libc +bash +tc +kmod-ifb +kmod-sched +kmod-sched-core +busybox
LUCI_PKGARCH:=all
PKG_NAME:=luci-app-speedlimit
PKG_VERSION:=1
PKG_RELEASE:=1


include $(TOPDIR)/feeds/luci/luci.mk

# call BuildPackage - OpenWrt buildroot signature