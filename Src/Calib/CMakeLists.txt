set(PROJECT_NAME camera-calibrator)
project(${PROJECT_NAME})

file(GLOB SOURCES *.cc)
file(GLOB HEADERS *.h)

add_executable(${PROJECT_NAME} ${SOURCES} ${VIDEO_SOURCE} ${HEADERS})

find_library(CVD_LIBRARIES cvd PATHS ${CVD_ROOT}/lib)
find_library(gvars_LIBRARIES GVars3 PATHS ${gvars_ROOT}/lib)

target_link_libraries(${PROJECT_NAME} xcs-ptam)
target_link_libraries(${PROJECT_NAME} ${CVD_LIBRARIES} ${gvars_LIBRARIES} ${TooN_LIBRARIES})
target_link_libraries(${PROJECT_NAME} ${gst_LIBRARIES})
                                                                       

