# Mac OS X specific code
set(MacOSX true)

# comatibility with older systems
set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -mmacosx-version-min=10.6 -fvisibility=hidden")
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -mmacosx-version-min=10.6 -fvisibility=hidden -fvisibility-inlines-hidden")
set(CMAKE_LFLAGS "${CMAKE_LFLAGS} -mmacosx-version-min=10.6")

if("${CMAKE_OSX_SYSROOT}" STREQUAL "")
# a minimum version since we are using notification center
    execute_process(COMMAND xcode-select --print-path
                    OUTPUT_VARIABLE XCODE_ROOT)
    string(STRIP ${XCODE_ROOT} XCODE_ROOT)
    set(CMAKE_OSX_SYSROOT "${XCODE_ROOT}/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.8.sdk/"
        CACHE PATH "Active Xcode path with required MacOS X SDK" FORCE)
endif()

# on Mac OS X app type should be MACOSX_BUNDLE
set(APP_TYPE MACOSX_BUNDLE)
set(BUILD_SHARED_LIBS false)

# http://clang.llvm.org/docs/AddressSanitizer.html
# Static linking is not supported.
if(BUILD_SHARED_LIBS)
    set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -fno-omit-frame-pointer")
    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -fno-omit-frame-pointer")
    set(CMAKE_LFLAGS "${CMAKE_LFLAGS} -fsanitize=address")
endif()

add_definitions(-DPOSIX=1)

set(ARTIFACT_PLATFORM_NAME "macosx-x86_64")
