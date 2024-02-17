SUMMARY = "ti_udhcpc dhcp client and supporting plugins."

LICENSE = "CLOSED"
LIC_FILES_CHKSUM = ""
#LICENSE = "GPLv2.0"
#LIC_FILES_CHKSUM = "file://COPYING;md5=8ca43cbc842c2336e835926c2166c28b" 

DEPENDS = "gw-ipc-svr"

INTELCE_PKG_REPO = "appcpu-infr"
INTELCE_PKG_SRC_DIR = "ti_udhcp"
SRCREV_ti-udhcp = "${AUTOREV}"
PR = "r0"

PARALLEL_MAKE = ""

#Replace -O2 compiler option with -Os
CFLAGS_remove = " -O2"
CFLAGS_append = " -Os"

CFLAGS_append = " -ffunction-sections -fdata-sections"
LDFLAGS_append = " -Wl,--gc-sections"

inherit puma_dac puma_useradd

PUMA_USERADD = "dhcpv4c"


do_puma_dac_append() {
    chmod 0500 ${D}${base_bindir}/ti_udhcpc
    chown ${PUMA_DAC_UID_DHCPV4C} ${D}${base_bindir}/ti_udhcpc
}

inherit intelce_package intelce_paths
inherit autotools 