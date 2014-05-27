set(PROJECT_NAME ptam)
project(${PROJECT_NAME})

file(GLOB SOURCES *.cc)
file(GLOB HEADERS *.h)

add_library(${PROJECT_NAME} STATIC ${SOURCES} ${HEADERS})
target_link_libraries(${PROJECT_NAME} ${TooN_LIBRARIES} ${CVD_LIBRARIES} ${gvars_LIBRARIES})
target_link_libraries(${PROJECT_NAME} ${gst_LIBRARIES})

if(UNIX)
    add_definitions("-fPIC")
endif(UNIX)

#
# Install 
#
install(TARGETS ${PROJECT_NAME}
        EXPORT ptam
        DESTINATION lib)

install(FILES ${HEADERS} DESTINATION include/ptam)

install(EXPORT ptam DESTINATION share)