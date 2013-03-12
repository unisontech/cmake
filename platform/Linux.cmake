# linux-specific goes here
set(LINUX true)
set(BUILD_SHARED_LIBRARIES false)
if(SANITIZER)
    set(BUILD_SHARED_LIBRARIES true)
endif()