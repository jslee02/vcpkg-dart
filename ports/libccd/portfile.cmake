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
    URLS "https://github.com/flexible-collision-library/fcl/archive/0.5.0.zip"
    FILENAME "fcl-0.5.0.zip"
    SHA512 d8488702989629a80297b9aea1f91fd5f3d0736f91cc5d7991a41ade99a445e9897c752fbedb2829350fabb5439d4ea31d34bbedb771b3e66aef23cd40b02122
)
vcpkg_extract_source_archive(${ARCHIVE})

vcpkg_configure_cmake(
    SOURCE_PATH ${CURRENT_BUILDTREES_DIR}/src/fcl-0.5.0
    # OPTIONS -DFCL_SOMETHING
    # OPTIONS_RELEASE -DOPTIMIZE=1
    # OPTIONS_DEBUG -DDEBUGGABLE=1
)

vcpkg_install_cmake()

# TODO(JS): Update below lines for fcl
#file(MAKE_DIRECTORY ${CURRENT_PACKAGES_DIR}/share)
#file(RENAME ${CURRENT_PACKAGES_DIR}/lib/cmake/assimp-3.3 ${CURRENT_PACKAGES_DIR}/share/assimp)
#file(REMOVE_RECURSE ${CURRENT_PACKAGES_DIR}/lib/cmake)
#file(REMOVE_RECURSE ${CURRENT_PACKAGES_DIR}/debug/lib/cmake)
#file(REMOVE_RECURSE ${CURRENT_PACKAGES_DIR}/debug/include)

# Handle copyright
#file(COPY ${CURRENT_BUILDTREES_DIR}/src/assimp-3.3.1/LICENSE DESTINATION ${CURRENT_PACKAGES_DIR}/share/assimp)
#file(RENAME ${CURRENT_PACKAGES_DIR}/share/assimp/LICENSE ${CURRENT_PACKAGES_DIR}/share/assimp/copyright)
