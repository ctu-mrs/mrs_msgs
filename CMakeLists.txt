cmake_minimum_required(VERSION 3.5)
project(mrs_msgs)

set(CMAKE_C_STANDARD 99)
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

function(mrs_validate_interfaces FILE_LIST EXTENSION)
  # 1. Check for physical files that were forgotten in the list
  file(GLOB_RECURSE physical_files RELATIVE ${CMAKE_CURRENT_SOURCE_DIR} "*.${EXTENSION}")

  foreach(p_file ${physical_files})
    if(IS_SYMLINK "${CMAKE_CURRENT_SOURCE_DIR}/${p_file}")
      continue()
    endif()

    if(NOT "${p_file}" IN_LIST ${FILE_LIST})
      message(WARNING "MISSING ${EXTENSION}: '${p_file}' exists in the folder but is NOT in your ${FILE_LIST}!")
    endif()
  endforeach()

  # 2. Check for naming collisions (Duplicate filenames in different subfolders)
  set(seen_names "")
  foreach(file_path ${${FILE_LIST}})
    get_filename_component(file_name ${file_path} NAME)

    if("${file_name}" IN_LIST seen_names)
      message(FATAL_ERROR
        "NAMING COLLISION: Multiple ${EXTENSION} files named '${file_name}' found in ${PROJECT_NAME}. "
        "ROS 2 requires unique filenames to flatten the install directory correctly."
        )
    endif()
    list(APPEND seen_names ${file_name})
  endforeach()
endfunction()

find_package(ament_cmake REQUIRED)
find_package(builtin_interfaces REQUIRED)
find_package(rosidl_default_generators REQUIRED)
find_package(std_msgs REQUIRED)
find_package(std_srvs REQUIRED)
find_package(sensor_msgs REQUIRED)
find_package(geometry_msgs REQUIRED)

# these files are auto-generated using the copy script
include(msg_list.txt)
include(srv_list.txt)

mrs_validate_interfaces(msg_files "msg")
mrs_validate_interfaces(srv_files "srv")

rosidl_generate_interfaces(${PROJECT_NAME}
    ${msg_files}
    ${srv_files}
    DEPENDENCIES builtin_interfaces geometry_msgs std_msgs sensor_msgs std_srvs
  )

ament_package()
