cmake_minimum_required(VERSION 3.10)

#print_vars(CMAKE_CURRENT_SOURCE_DIR)
#set(VAR1 100)
#set(VAR2 "Two hundred")
#configure_file("${CMAKE_CURRENT_SOURCE_DIR}/config/config.h.in" "${CMAKE_CURRENT_SOURCE_DIR}/config/config.h")


#set(APP_VERSION_MAJOR 1)
#set(APP_VERSION_MINOR 2)
#set(APP_VERSION_BUILD 5)
#configure_file("${CMAKE_CURRENT_SOURCE_DIR}/app-version.h.in" "${CMAKE_CURRENT_SOURCE_DIR}/app-version.h")
#print_vars(CMAKE_CURRENT_SOURCE_DIR)


#=== Application ===="
project(app VERSION ${APP_VERSION_MAJOR}.${APP_VERSION_MINOR}.${APP_VERSION_BUILD} LANGUAGES CXX)
file(GLOB_RECURSE APP_SRC "*.cpp" "*.h")
print_vars(PROJECT_NAME APP_SRC)
add_executable(${PROJECT_NAME} ${APP_SRC})
set_target_properties(${PROJECT_NAME} PROPERTIES OUTPUT_NAME ${PROJECT_NAME}-${PROJECT_VERSION})
set(APP ${PROJECT_NAME})


add_subdirectory(subdir1)
target_link_libraries(${PROJECT_NAME} PRIVATE subdir1)

add_subdirectory(subdir2)
target_link_libraries(${PROJECT_NAME} PRIVATE subdir2)
