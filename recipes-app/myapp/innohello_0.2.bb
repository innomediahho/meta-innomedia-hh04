SUMMARY = "My hello world app test."
DESCRIPTION = "Bah blah blah"
LICENSE = "MIT"
LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"

# Where to find the source files (can be local, Git, etc.)
SRC_URI = "file://src"

# Where to keep downloaded source files (in tmp/work/...)
S = "${WORKDIR}/src"

# Pass arguments to linker (required)
TARGET_CC_ARCH += "${LDFLAGS}"

# Cross-compile source (Can do makefiles...)
do_compile() {
  ${CC} -o innohello innohello.c
}

# Plant into the embedded system rootfs /usr/bin image
do_install() {
  install -d ${D}${bindir}
  install -m 0755 innohello ${D}${bindir}
}

python do_display_banner() {
    bb.plain("***********************************************");
    bb.plain("*                                             *");
    bb.plain("* Howard's innohello recipe bitbake-layer     *");
    bb.plain("*                                             *");
    bb.plain("***********************************************");
}

addtask display_banner before do_build
