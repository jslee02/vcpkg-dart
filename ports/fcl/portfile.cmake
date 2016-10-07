# Common Ambient Variables:
#   VCPKG_ROOT_DIR = <C:\path\to\current\vcpkg>
#   TARGET_TRIPLET is the current triplet (x86-windows, etc)
#   PORT is the current port name (zlib, etc)
#   CURRENT_BUILDTREES_DIR = ${VCPKG_ROOT_DIR}\buildtrees\${PORT}
#   CURRENT_PACKAGES_DIR  = ${VCPKG_ROOT_DIR}\packages\${PORT}_${TARGET_TRIPLET}
#

include(${CMAKE_TRIPLET_FILE})
include(vcpkg_common_functions)
vcpkg_download_distfile(ARCHIVE
    URLS "https://github.com/flexible-collision-library/fcl/archive/master.zip"
    FILENAME "fcl-master.zip"
    #SHA512 a1611e414c56d70318b8d0b09f7949c3c49a135ea3ffc83369724e94e1cb5ec737e8b18449765f4c8a33084cef87cd2ea2e116b3a17c158c2437dc8e847d5bfb 0.5.0
    SHA512 ce9c22dfe96e4e6ac0fb203316bbce2b6defe07231c95511111b12d722b82ae670772b5c0286eed129bffe8eb0de4be0db2303fd8b4951f6fd465f4e05fce80e
)
vcpkg_extract_source_archive(${ARCHIVE})

vcpkg_configure_cmake(
    SOURCE_PATH ${CURRENT_BUILDTREES_DIR}/src/fcl-master
    # OPTIONS -DUSE_THIS_IN_ALL_BUILDS=1
    # OPTIONS_RELEASE -DOPTIMIZE=1
    # OPTIONS_DEBUG -DDEBUGGABLE=1
)

vcpkg_install_cmake()
