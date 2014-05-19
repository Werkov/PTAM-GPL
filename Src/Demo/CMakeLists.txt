set(PROJECT_NAME ptam-demo)
project(${PROJECT_NAME})

file(GLOB SOURCES *.cc)
file(GLOB HEADERS *.h)

add_executable(${PROJECT_NAME} ${SOURCES} ${VIDEO_SOURCE} ${HEADERS})

target_link_libraries(${PROJECT_NAME} ptam)
target_link_libraries(${PROJECT_NAME} ${CVD_LIBRARIES} ${gvars_LIBRARIES} ${TooN_LIBRARIES})
target_link_libraries(${PROJECT_NAME} ${gst_LIBRARIES})
