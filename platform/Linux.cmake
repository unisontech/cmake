# linux-specific goes here
set(LINUX true)
set(BUILD_SHARED_LIBS false)
if(SANITIZER)
    set(BUILD_SHARED_LIBS true)
endif()
add_definitions(-DPOSIX)
set(ARTIFACT_PLATFORM_NAME "linux-x86_64")
