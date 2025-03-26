cmake_minimum_required(VERSION 3.5)
project(mrs_msgs)

set(CMAKE_C_STANDARD 99)
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

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

rosidl_generate_interfaces(${PROJECT_NAME}
  ${msg_files}
  ${srv_files}
  DEPENDENCIES builtin_interfaces geometry_msgs std_msgs sensor_msgs std_srvs
)

install(
  FILES bridge_mapping.yaml
  DESTINATION share/${PROJECT_NAME}
)

file(GLOB_RECURSE all_srv_files RELATIVE "${CMAKE_CURRENT_SOURCE_DIR}/srv" "${CMAKE_CURRENT_SOURCE_DIR}/srv/*.srv")

foreach(srv_file ${all_srv_files})
  get_filename_component(srv_filename ${srv_file} NAME)
  configure_file(${CMAKE_CURRENT_SOURCE_DIR}/srv/${srv_file} ${CMAKE_CURRENT_BINARY_DIR}/${srv_filename} COPYONLY)
  install(FILES ${CMAKE_CURRENT_BINARY_DIR}/${srv_filename}
    DESTINATION share/${PROJECT_NAME}/srv)
endforeach()

file(GLOB_RECURSE all_msg_files RELATIVE "${CMAKE_CURRENT_SOURCE_DIR}/msg" "${CMAKE_CURRENT_SOURCE_DIR}/msg/*.msg")

foreach(msg_file ${all_msg_files})
  get_filename_component(msg_filename ${msg_file} NAME)
  configure_file(${CMAKE_CURRENT_SOURCE_DIR}/msg/${msg_file} ${CMAKE_CURRENT_BINARY_DIR}/${msg_filename} COPYONLY)
  install(FILES ${CMAKE_CURRENT_BINARY_DIR}/${msg_filename}
    DESTINATION share/${PROJECT_NAME}/msg)
endforeach()



ament_package()
