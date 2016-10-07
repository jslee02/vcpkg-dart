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
    URLS "https://github.com/danfis/libccd/archive/v2.0.zip"
    FILENAME "libccd-2.0.zip"
    SHA512 3bed2c971d20bea8c656f44383196c9e2dd0fc0cf46aaf0a6bb800b62103d9368a192ec0f92b274fc45733c09bcb3796eed48ce5ba7817e66a566bd0987ad21f
)
vcpkg_extract_source_archive(${ARCHIVE})

vcpkg_configure_cmake(
    SOURCE_PATH ${CURRENT_BUILDTREES_DIR}/src/libccd-2.0
    # OPTIONS -DUSE_THIS_IN_ALL_BUILDS=1
    # OPTIONS_RELEASE -DOPTIMIZE=1
    # OPTIONS_DEBUG -DDEBUGGABLE=1
)

vcpkg_install_cmake()

file(REMOVE_RECURSE ${CURRENT_PACKAGES_DIR}/debug/include)

# Handle copyright
file(COPY ${CURRENT_BUILDTREES_DIR}/src/libccd-2.0/BSD-LICENSE DESTINATION ${CURRENT_PACKAGES_DIR}/share/libccd)
file(RENAME ${CURRENT_PACKAGES_DIR}/share/libccd/BSD-LICENSE ${CURRENT_PACKAGES_DIR}/share/libccd/copyright)
