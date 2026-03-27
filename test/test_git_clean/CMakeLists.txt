get_filename_component(TEST_NAME "${CMAKE_CURRENT_SOURCE_DIR}" NAME)

ament_add_test(test_git_clean
  COMMAND /bin/bash "${CMAKE_CURRENT_SOURCE_DIR}/test_git_clean.sh"
  APPEND_ENV PYTHONPATH=${CMAKE_CURRENT_BINARY_DIR}
  # This ensures that a return code of 0 is treated as a pass in the XML generation
  GENERATE_RESULT_FOR_RETURN_CODE_ZERO
  TIMEOUT 60
)
