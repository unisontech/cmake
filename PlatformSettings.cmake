# platforms
# pls note that some platforms defines APP_TYPE variable,
# so it should be used for every executable on add_executable
#
# android can be built on any system, so we check target system explicitly first

# build type
if(NOT CMAKE_BUILD_TYPE)
    set(CMAKE_BUILD_TYPE Debug)
endif()
message(STATUS "CMake build type: ${CMAKE_BUILD_TYPE}")

set(LIBRARY_TYPE SHARED)

if(${CMAKE_TARGET_SYSTEM} MATCHES "Android")
    set(PLATFORM "Android")
    include(cmake/platform/Android.cmake)
elseif(APPLE)
    # APPLE can build both iOS and Mac OS X
    # so we first check if target system is iOS
    if(iOS)
        set(PLATFORM "iOS")
        include(cmake/platform/iOS.cmake)
    elseif(${CMAKE_SYSTEM_NAME} MATCHES "Darwin")
        set(PLATFORM "Mac OS X")
        include(cmake/platform/MacOSX.cmake)
    endif()
elseif(WIN32 AND NOT CYGWIN)
    # WIN32 can be only Windows, but sometimes with Cygwin, so we distignish them
    set(PLATFORM "Windows")
    include(cmake/platform/Windows.cmake)
elseif(UNIX)
    # other unix types, Cygwin is here as well...
    if(${CMAKE_SYSTEM_NAME} MATCHES "Linux")
        set(PLATFORM "Linux")
        include(cmake/platform/Linux.cmake)
    endif()
endif()

if("${PLATFORM}" STREQUAL "")
    message(FATAL_ERROR "Unsupported platform, pls make sure it is listed in PlatformSettings.cmake with respect to platforms specifics")
else()
    message(STATUS "Selected platform: ${PLATFORM}")
endif()

if (EXISTS ${CMAKE_TOOLCHAIN_FILE})
    message(STATUS "Using custom toolchain file ${CMAKE_TOOLCHAIN_FILE}")
endif(EXISTS ${CMAKE_TOOLCHAIN_FILE})
