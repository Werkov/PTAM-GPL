cmake_minimum_required(VERSION 2.8)
project(ptam)

set(CVD_ROOT ../ThirdParty/Build/libcvd)
set(TooN_ROOT ../ThirdParty/Build/TooN)
set(gvars_ROOT ../ThirdParty/Build/gvars)

# Linux video source
set(VIDEO_SOURCE ${CMAKE_CURRENT_SOURCE_DIR}/VideoSource_Linux_Gstreamer_File.cc)
include_directories(/usr/include/gstreamer-0.10 /usr/include/glib-2.0 /usr/lib/x86_64-linux-gnu/glib-2.0/include /usr/include/libxml2)
include_directories(/usr/include/glib-2.0 /usr/lib/x86_64-linux-gnu/glib-2.0/include)
find_library(CVD_LIBRARIES cvd PATHS ${CVD_ROOT}/lib)
set(gst_LIBRARIES pthread gstapp-0.10 gstbase-0.10 gstreamer-0.10 gobject-2.0 gmodule-2.0 gthread-2.0 rt xml2 glib-2.0)
# End of video source


set(CMAKE_LINKER_FLAGS "-Wl,--no-undefined") # show unresolved symbols during link time

include_directories(${CVD_ROOT}/include;${TooN_ROOT}/include;${gvars_ROOT}/include)

find_library(CVD_LIBRARIES cvd PATHS ${CVD_ROOT}/lib)
find_library(gvars_LIBRARIES GVars3 PATHS ${gvars_ROOT}/lib)
find_library(TooN_LIBRARIES lapack)



include_directories(Lib)

add_subdirectory(Calib)
add_subdirectory(Demo)
add_subdirectory(Lib)
