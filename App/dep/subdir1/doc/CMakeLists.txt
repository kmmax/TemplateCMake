cmake_minimum_required(VERSION 3.10)


# ==== Global definitions ====
project(modbus VERSION 3.1.7 LANGUAGES C)
set(Src libmodbus-3.1.7)	# name of library folder
message("=== CMakeLists.txt: Main ====")


set(CMAKE_BUILD_TYPE Release)
set(Full_Name ${PROJECT_NAME}-${PROJECT_VERSION})
message(STATUS ${Full_Name} ": " ${CMAKE_BUILD_TYPE})


file(GLOB_RECURSE PROJ_HDR "${Src}/src/*.h")
# Макрос составляет список путей к всем заголовочным файлам
macro(HEADER_DIRECTORIES return_list)
        foreach(file_path ${PROJ_HDR})
                get_filename_component(dir_path ${file_path} PATH)
                set(dir_list ${dir_list} ${dir_path})
        endforeach()
        list(REMOVE_DUPLICATES dir_list)
        set(${return_list} ${dir_list})
endmacro()

HEADER_DIRECTORIES(header_dir_list)
list(LENGTH header_dir_list header_dir_list_count)
message(STATUS "[INFO] Found ${header_dir_list_count} header directories:")
foreach(file_path ${header_dir_list})
        message(STATUS "\t" ${file_path})
endforeach()


file(GLOB_RECURSE PROJ_SRC "${Src}/src/*.c")
message(${PROJ_SRC})


# ==== Сборка библиотеки ====
add_library(${Full_Name} SHARED ${PROJ_SRC})
target_include_directories(${Full_Name} PUBLIC ${header_dir_list})
target_link_libraries(${Full_Name} "ws2_32")
