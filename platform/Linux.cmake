# linux-specific goes here
set(LINUX true)
set(BUILD_SHARED_LIBS false)
if(SANITIZER)
    set(BUILD_SHARED_LIBS true)
endif()