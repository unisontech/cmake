# compilers
set(CMAKE_CXX_FLAGS_RELEASE "${CMAKE_CXX_FLAGS_RELEASE} -DQT_NO_DEBUG_OUTPUT")
if("${CMAKE_CXX_COMPILER_ID}" STREQUAL "MSVC")
    # using Visual Studio C++, use -W3
    set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -WX -W 3 /EHsc")
    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -WX -W 3 /EHsc")
else()
    # using Clang, GNU or Intel
    # just a good practice
    set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -Wall -Wextra -Werror")
    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wall -Wextra -Werror")
endif("${CMAKE_CXX_COMPILER_ID}" STREQUAL "MSVC")
# special definitions
set(CMAKE_C_FLAGS_RELEASE "${CMAKE_C_FLAGS_RELEASE} -DQT_NO_DEBUG")
set(CMAKE_CXX_FLAGS_RELEASE "${CMAKE_CXX_FLAGS_RELEASE} -DQT_NO_DEBUG")

# Output compilers settings
include(cmake/VerboseCompilerMessage.cmake)
