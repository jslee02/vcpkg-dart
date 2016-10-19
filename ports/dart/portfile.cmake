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
    URLS "https://github.com/dartsim/dart/archive/v6.1.1.zip"
    FILENAME "dart-6.1.1.zip"
    SHA512 be7992a3bab53966bb08449271fce002ed2a845044b7480725a847e0bcf1e63087992fda8ff820f32cf4fb2290323dc17b8da75f6684184bc3b2a1c57a7303a4
)
vcpkg_extract_source_archive(${ARCHIVE})

vcpkg_configure_cmake(
    SOURCE_PATH ${CURRENT_BUILDTREES_DIR}/src/dart-6.1.1
    # OPTIONS -DUSE_THIS_IN_ALL_BUILDS=1
    # OPTIONS_RELEASE -DOPTIMIZE=1
    # OPTIONS_DEBUG -DDEBUGGABLE=1
    OPTIONS -DDART_VERBOSE=ON
)

vcpkg_install_cmake()  
