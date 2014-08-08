set(PROJECT_NAME xcs-ptam)
project(${PROJECT_NAME})

file(GLOB SOURCES *.cc)
file(GLOB HEADERS *.h)

add_library(${PROJECT_NAME} STATIC ${SOURCES} ${HEADERS})
target_link_libraries(${PROJECT_NAME} ${gst_LIBRARIES})

if(UNIX)
    target_link_libraries(${PROJECT_NAME} GL)
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