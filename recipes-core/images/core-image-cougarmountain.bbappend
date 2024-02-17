SUMMARY = "Customize Atom innomedia linux image."
IMAGE_LINGUAS = " "
LICENSE = "MIT"
DESCRIPTION = "Add our own items into the firmware"

#require ${COREBASE}/meta/recipes-core/images/core-image-minimal.bb

inherit intel_sdk

# Include modules in rootfs
IMAGE_INSTALL += " \
ti-udhcp  \
"

#require ../uimage/uimage-service.inc

python do_display_banner() {
    bb.plain("***********************************************");
    bb.plain("*                                             *");
    bb.plain("* Howard's Atom image by bitbake-layers       *");
    bb.plain("*                                             *");
    bb.plain("***********************************************");
}

addtask display_banner before do_build
