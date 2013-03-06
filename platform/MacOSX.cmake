# Mac OS X specific code
set(MacOSX true)

# comatibility with older systems
set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -fno-omit-frame-pointer -mmacosx-version-min=10.6 -fvisibility=hidden")
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -fno-omit-frame-pointer -mmacosx-version-min=10.6 -fvisibility=hidden -fvisibility-inlines-hidden")
set(CMAKE_LFLAGS "${CMAKE_LFLAGS} -fsanitize=address -mmacosx-version-min=10.6")

# on Mac OS X app type should be MACOSX_BUNDLE
set(APP_TYPE MACOSX_BUNDLE)
set(BUILD_SHARED_LIBS false)
