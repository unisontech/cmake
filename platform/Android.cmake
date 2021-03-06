# Android-specific settings
#
###############################
# TOOLCHAIN SETTINGS          #
###############################
set(BUILD_SHARED_LIBS false)

if( CMAKE_HOST_WIN32 AND NOT CMAKE_GENERATOR STREQUAL "MinGW Makefiles")
   message( "You need to use MinGW Makefile generator explicitly")
   set(CMAKE_MAKE_PROGRAM "$ANDROID_NDK/prebuilt/windows/bin/make.exe" CACHE FILEPATH "Path to the MinGW make")
endif()


###############################
# Qt SETTINGS                 #
###############################
set(QT_ROOT $ENV{QT_ROOT} CACHE FILEPATH "Path to the directory there Qt4 for Android is located")
set(QT_QMAKE_EXECUTABLE "${QT_ROOT}/bin/qmake")

set(ARTIFACT_PLATFORM_NAME "android-armv7")

include_directories()
