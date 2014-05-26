cmake_minimum_required(VERSION 2.8)
project(ptam)

set(THIRD_PARTY ../ThirdParty)

set(TooN_ROOT ${THIRD_PARTY}/Build/TooN)
set(TooN_INCLUDES ${THIRD_PARTY}/Src)
set(CVD_ROOT ${THIRD_PARTY}/Build/libcvd)
set(CVD_INCLUDES ${THIRD_PARTY}/Src/libcvd)

set(gvars_ROOT ${THIRD_PARTY}/Build/gvars)
set(gvars_INCLUDES ${THIRD_PARTY}/Src/gvars)

set(USE_GSTREAMER 0)

if(USE_GSTREAMER)
	# Linux video source
	set(VIDEO_SOURCE ${CMAKE_CURRENT_SOURCE_DIR}/VideoSource_Linux_Gstreamer_File.cc)
	include_directories(/usr/include/gstreamer-0.10 /usr/include/glib-2.0 /usr/lib/x86_64-linux-gnu/glib-2.0/include /usr/include/libxml2)
	include_directories(/usr/include/glib-2.0 /usr/lib/x86_64-linux-gnu/glib-2.0/include)
	find_library(CVD_LIBRARIES cvd PATHS ${CVD_ROOT}/lib)
	set(gst_LIBRARIES pthread gstapp-0.10 gstbase-0.10 gstreamer-0.10 gobject-2.0 gmodule-2.0 gthread-2.0 rt xml2 glib-2.0)
	# End of video source
else()
	set(VIDEO_SOURCE ${CMAKE_CURRENT_SOURCE_DIR}/VideoSource_stub.cc)
endif(USE_GSTREAMER)


set(CMAKE_LINKER_FLAGS "-Wl,--no-undefined") # show unresolved symbols during link time

include_directories(${TooN_INCLUDES};${CVD_INCLUDES};${gvars_INCLUDES})

find_library(CVD_LIBRARIES cvd PATHS ${CVD_ROOT}/lib)
find_library(gvars_LIBRARIES GVars3 PATHS ${gvars_ROOT}/lib)
find_library(TooN_LIBRARIES lapack NAMES lapack_win64_MT)



include_directories(Lib)

add_subdirectory(Calib)
add_subdirectory(Demo)
add_subdirectory(Lib)

#
# Install 
#
install(DIRECTORY ${TooN_INCLUDES}/TooN DESTINATION include FILES_MATCHING PATTERN "*.h" PATTERN "*.hh")

install(DIRECTORY ${CVD_INCLUDES}/cvd DESTINATION include)
install(DIRECTORY ${CVD_ROOT}/lib DESTINATION .)

install(DIRECTORY ${gvars_INCLUDES}/gvars3 DESTINATION include)
install(DIRECTORY ${gvars_ROOT}/lib DESTINATION .)

