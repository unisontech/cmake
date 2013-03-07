# linux-specific goes here
set(LINUX true)
if(SANITIZER)
    set(BUILD_SHARED_LIBRARIES true)
else()
    set(BUILD_SHARED_LIBRARIES false)
endif()