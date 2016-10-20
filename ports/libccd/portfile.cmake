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
    URLS "https://github.com/danfis/libccd/archive/master.zip"
    FILENAME "libccd-master.zip"
    SHA512 20abff1f08d8cdadb0e8ca3653d42f9aa7b6f54f98c5101a07926289f33399f075a2ffdc39bdb36936219cf7007fddb21bbdf4d15646770707c7d65ac3a12e5e
)
vcpkg_extract_source_archive(${ARCHIVE})

vcpkg_configure_cmake(
    SOURCE_PATH ${CURRENT_BUILDTREES_DIR}/src/libccd-master
    # OPTIONS -DUSE_THIS_IN_ALL_BUILDS=1
    # OPTIONS_RELEASE -DOPTIMIZE=1
    # OPTIONS_DEBUG -DDEBUGGABLE=1
)

vcpkg_install_cmake()

#file(MAKE_DIRECTORY ${CURRENT_PACKAGES_DIR}/share)
#file(RENAME ${CURRENT_PACKAGES_DIR}/lib/cmake/ccd ${CURRENT_PACKAGES_DIR}/share/ccd)

# Avoid a copy of include file in debug
file(REMOVE_RECURSE ${CURRENT_PACKAGES_DIR}/debug/include)

# Handle copyright
file(COPY ${CURRENT_BUILDTREES_DIR}/src/libccd-master/BSD-LICENSE DESTINATION ${CURRENT_PACKAGES_DIR}/share/libccd)
file(RENAME ${CURRENT_PACKAGES_DIR}/share/libccd/BSD-LICENSE ${CURRENT_PACKAGES_DIR}/share/libccd/copyright)
