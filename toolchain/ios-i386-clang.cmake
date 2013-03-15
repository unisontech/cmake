set(CMAKE_SYSTEM_PROCESSOR "i386")
set(IOS_TARGET "iPhoneSimulator")
set(IOS_SDK_VERSION "6.0" CACHE STRING "SDK version" FORCE)
set(CMAKE_OSX_SYSROOT "iphonesimulator${IOS_SDK_VERSION}" CACHE STRING "SDK version" FORCE)
set(IOS_ARCH i386)
set(LIBRARY_OUTPUT_PATH "${CMAKE_SOURCE_DIR}/lib/ios_simulator" CACHE PATH "path for ios simulator libs")



##################################################
### This a common part for both i386 and armv7 ###
##################################################

set(CMAKE_CROSSCOMPILING TRUE)

set(CMAKE_SYSTEM_NAME "Darwin")

set(APPLE 1)
set(iOS 1)

find_program(CMAKE_XCODE_SELECT xcode-select)
if(CMAKE_XCODE_SELECT)
	execute_process(COMMAND ${CMAKE_XCODE_SELECT} "-print-path" OUTPUT_VARIABLE OSX_DEVELOPER_ROOT OUTPUT_STRIP_TRAILING_WHITESPACE)
endif()

set(IOS_DEVELOPER_ROOT "${OSX_DEVELOPER_ROOT}/Platforms/${IOS_TARGET}.platform/Developer")
set(IOS_SDK_ROOT "${IOS_DEVELOPER_ROOT}/SDKs/${IOS_TARGET}${IOS_SDK_VERSION}.sdk")

set(PLATFORM_OPENSSL_PATH "${OPENSSL_PATH}/bin/${IOS_TARGET}${IOS_SDK_VERSION}-${IOS_ARCH}.sdk")

set(CMAKE_OSX_ARCHITECTURES "${IOS_ARCH}" CACHE STRING "SDK Architecture" FORCE)

set(CMAKE_FIND_FRAMEWORK FIRST)

set(CMAKE_SYSTEM_FRAMEWORK_PATH
	${IOS_SDK_ROOT}/System/Library/Frameworks
	${IOS_SDK_ROOT}/Developer/Library/Frameworks
	)

set(CMAKE_FIND_ROOT_PATH
	"${IOS_DEVELOPER_ROOT}"
	"${IOS_SDK_ROOT}"
	)

set(CMAKE_C_COMPILER   "${OSX_DEVELOPER_ROOT}/Toolchains/XcodeDefault.xctoolchain/usr/bin/clang" CACHE PATH "C compiler" FORCE)
set(CMAKE_CXX_COMPILER "${OSX_DEVELOPER_ROOT}/Toolchains/XcodeDefault.xctoolchain/usr/bin/clang++" CACHE PATH "C++ compiler" FORCE)

set(CMAKE_C_FLAGS "-isysroot ${IOS_SDK_ROOT} -miphoneos-version-min=4.3 -arch ${IOS_ARCH}" CACHE STRING "C flags" FORCE)
set(CMAKE_CXX_FLAGS "${CMAKE_C_FLAGS}" CACHE STRING "C++ flags" FORCE)

set(CMAKE_CXX_COMPILER_WORKS TRUE)
set(CMAKE_C_COMPILER_WORKS TRUE)

set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)
