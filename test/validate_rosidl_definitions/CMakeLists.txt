get_filename_component(TEST_NAME "${CMAKE_CURRENT_SOURCE_DIR}" NAME)

ament_add_test(validate_rosidl_definitions
  COMMAND /bin/bash "${CMAKE_CURRENT_SOURCE_DIR}/validate_rosidl_definitions.sh"
  GENERATE_RESULT_FOR_RETURN_CODE_ZERO
  TIMEOUT 60
)
