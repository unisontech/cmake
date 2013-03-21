# iOS specific settings goes here

# this is important for iOS executables
SET(APP_TYPE MACOSX_BUNDLE)
set(BUILD_SHARED_LIBS false)

###############################
# Qt SETTINGS                 #
###############################

if( "${TARG}" STREQUAL "device" AND "${CFG}" STREQUAL "Debug" )
	set(iOS_QT $ENV{iOS_QT_DEVICE_DEBUG} CACHE FILEPATH "Path to the directory where Qt for iOS is located")
elseif( "${TARG}" STREQUAL "device" AND "${CFG}" STREQUAL "Release" )
	set(iOS_QT $ENV{iOS_QT_DEVICE_RELEASE} CACHE FILEPATH "Path to the directory where Qt for iOS is located")
elseif( "${TARG}" STREQUAL "simulator" )
	set(iOS_QT $ENV{iOS_QT_SIMULATOR} CACHE FILEPATH "Path to the directory where Qt for iOS is located")
endif()

set(QT_QMAKE_EXECUTABLE "${iOS_QT}/bin/qmake")

set(CMAKE_FIND_ROOT_PATH ${CMAKE_FIND_ROOT_PATH} "/")

include_directories("${PLATFORM_OPENSSL_PATH}/include/openssl")

set(ARTIFACT_PLATFORM_NAME "ios-${IOS_ARCH}")

message(STATUS "QT_QMAKE_EXECUTABLE: ${QT_QMAKE_EXECUTABLE}")
