if(NOT COMMON_COMPILER_FLAGS_CMAKE)
set(COMMON_COMPILER_FLAGS_CMAKE true)

# compilers
set(CMAKE_CXX_FLAGS_RELEASE "${CMAKE_CXX_FLAGS_RELEASE} -DQT_NO_DEBUG_OUTPUT")
if("${CMAKE_CXX_COMPILER_ID}" STREQUAL "MSVC")
    # using Visual Studio C++, use -W3
    set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -WX -W 3 /EHsc")
    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -WX -W 3 /EHsc")
else()
    # using Clang, GNU or Intel
    set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -Wall -Wextra -Werror -fPIC")
    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wall -Wextra -Werror -fPIC -fcatch-undefined-behavior")
endif("${CMAKE_CXX_COMPILER_ID}" STREQUAL "MSVC")
# special definitions
set(CMAKE_C_FLAGS_RELEASE "${CMAKE_C_FLAGS_RELEASE} -DQT_NO_DEBUG")
set(CMAKE_CXX_FLAGS_RELEASE "${CMAKE_CXX_FLAGS_RELEASE} -DQT_NO_DEBUG")

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
