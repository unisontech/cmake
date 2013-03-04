# Mac OS X specific code

# comatibility with older systems
set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -mmacosx-version-min=10.6")
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -mmacosx-version-min=10.6")
set(CMAKE_LFLAGS "${CMAKE_LFLAGS} -mmacosx-version-min=10.6")

# on Mac OS X app type should be MACOSX_BUNDLE
set(APP_TYPE MACOSX_BUNDLE)
set(LIBRARY_TYPE STATIC)
set(BUILD_SHARED_LIBS false)
set(BUILD_STATIC_LIBS true)
