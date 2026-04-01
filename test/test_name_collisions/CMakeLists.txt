get_filename_component(TEST_NAME "${CMAKE_CURRENT_SOURCE_DIR}" NAME)

ament_add_test(test_name_collisions
  COMMAND /bin/bash "${CMAKE_CURRENT_SOURCE_DIR}/test_name_collisions.sh"
  GENERATE_RESULT_FOR_RETURN_CODE_ZERO
  TIMEOUT 10
)
