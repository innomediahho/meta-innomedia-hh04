SUMMARY = "Innomedia patch to TI uDHCP on Intel Atom side (ti-udhcp)"
DESCRIPTION = "Try to patch the uDHCP from intelsdk?"
LICENSE = "CLOSED"
LIC_FILES_CHKSUM = ""

#DEPENDS += "intelce-build"
#INTELCE_PKG_REPO = "appcpu-infr"
#INTELCE_PKG_SRC_DIR = "kernel-driver/datapipe/src"

# This isn't in ARM but appears in the Atom side... so it shouldn't be BUT just to test an idea
# INTELCE_PKG_REPO = "appcpu-infr"

# If local folder in '.../innocli/src'
#FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
# mysrc is the folder where the source code, etc is located in yocoto
FILESEXTRAPATHS_prepend := "${THISDIR}/mypatch:"

# /tmp/work/cougarmountain-poky-linux/datapipe-mod/git+AUTOINC-r0/datapipe-mod-git+AUTOINC/ti_udhcp
# we need to select the required files to be pulled into ${WORKDIR} to be built... 
# don't know how to pull all files unless it is git
SRC_URI += " \
	file://inno-ti-udhcp.patch;patchdir=${WORKDIR}/ti-udhcp-git+AUTOINC/ti_udhcp \
	"

# flags to enable our features
CFLAGS_append = " -DCONFIG_VENDOR_INNOMEDIA_SMART_DQOS"

# Patch files and any pre-compile operations (this excutes in umftmp)
do_configure_append() {
  echo "Replace the files with ours in do_configure:append()" > do_configure.txt
#  cp ${WORKDIR}/*.c  ti/netdk/src/ti_udhcp
#  cp ${WORKDIR}/*.h  ti/netdk/src/ti_udhcp
}

python do_display_banner() {
    bb.plain("***********************************************");
    bb.plain("*                                             *");
    bb.plain("* Innomedia TI uDHCP patch bitbake-layer      *");
    bb.plain("*                                             *");
    bb.plain("***********************************************");
}

addtask display_banner before do_build