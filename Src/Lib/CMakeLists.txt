set(PROJECT_NAME ptam-core)
project(${PROJECT_NAME})

file(GLOB SOURCES *.cc)
file(GLOB HEADERS *.h)

add_library(${PROJECT_NAME} ${SOURCES} ${HEADERS})
target_link_libraries(${PROJECT_NAME} ${CVD_LIBRARIES} ${gvars_LIBRARIES} ${TooN_LIBRARIES})
target_link_libraries(${PROJECT_NAME} ${gst_LIBRARIES})