set(PROJECT_NAME ptam)
project(${PROJECT_NAME})

file(GLOB SOURCES *.cc)
file(GLOB HEADERS *.h)

add_library(${PROJECT_NAME} SHARED ${SOURCES} ${HEADERS})
target_link_libraries(${PROJECT_NAME} ${CVD_LIBRARIES} ${gvars_LIBRARIES} ${TooN_LIBRARIES})
target_link_libraries(${PROJECT_NAME} ${gst_LIBRARIES})

#
# Install 
#
install(TARGETS ${PROJECT_NAME}
        EXPORT ptam
        DESTINATION lib)

install(FILES ${HEADERS} DESTINATION include/ptam)

install(EXPORT ptam DESTINATION share)