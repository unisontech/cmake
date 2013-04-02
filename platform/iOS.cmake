# iOS specific settings goes here

# this is important for iOS executables
SET(APP_TYPE MACOSX_BUNDLE)
set(BUILD_SHARED_LIBS false)

###############################
# Qt SETTINGS                 #
###############################

set(QT_QMAKE_EXECUTABLE "${iOS_QT}/bin/qmake")

set(CMAKE_FIND_ROOT_PATH ${CMAKE_FIND_ROOT_PATH} "/")

set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -fvisibility=hidden")
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -fvisibility=hidden -fvisibility-inlines-hidden")

include_directories("${PLATFORM_OPENSSL_PATH}/include/openssl")

set(ARTIFACT_PLATFORM_NAME "ios-${IOS_ARCH}")

message(STATUS "QT_QMAKE_EXECUTABLE: ${QT_QMAKE_EXECUTABLE}")
