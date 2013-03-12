if(NOT COMMON_COMPILER_FLAGS_CMAKE)
set(COMMON_COMPILER_FLAGS_CMAKE true)

# compilers
if("${CMAKE_CXX_COMPILER_ID}" STREQUAL "MSVC")
    # using Visual Studio C++, use -W3 or -W4
    # FIXME: add following warnings later or find a way to use -W4:
    #  -we4702
    #  -we4710
    set(MSVC_W4_WARNINGS "-we4100 -we4101 -we4189 -we4700 -we4701 -we4705 -we4706 -we4722 -we4723")
    set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -WX -W3 ${MSVC_W4_WARNINGS} /EHsc")
    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -WX -W3 ${MSVC_W4_WARNINGS} /EHsc")
    if(MSVC12)
        # With Visual Studio 2012 add /sdl flag for treating security warnings as errors
        set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} /sdl")
        set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} /sdl")
    endif()
else()
    # using Clang, GNU or Intel
    set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -Wall -Wextra -Werror -fPIC")
    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wall -Wextra -Werror -fPIC")
endif("${CMAKE_CXX_COMPILER_ID}" STREQUAL "MSVC")
# special definitions
set(CMAKE_C_FLAGS_RELEASE "${CMAKE_C_FLAGS_RELEASE} -DQT_NO_DEBUG -DQT_NO_DEBUG_OUTPUT -DQT_NO_DEBUG_STREAM -DQT_NO_WARNING_OUTPUT")
set(CMAKE_CXX_FLAGS_RELEASE "${CMAKE_CXX_FLAGS_RELEASE} -DQT_NO_DEBUG -DQT_NO_DEBUG_OUTPUT -DQT_NO_DEBUG_STREAM -DQT_NO_WARNING_OUTPUT")

# clang static analyzer
if(STATIC_ANALYZER)
    set(CMAKE_C_FLAGS "--analyze -S -Qunused-arguments")
    set(CMAKE_CXX_FLAGS "--analyze -S -Qunused-arguments")
    set(CMAKE_C_FLAGS_RELEASE "")
    set(CMAKE_CXX_FLAGS_RELEASE "")
endif()

# Output compilers settings
include(cmake/VerboseCompilerMessage.cmake)

endif(NOT COMMON_COMPILER_FLAGS_CMAKE)
