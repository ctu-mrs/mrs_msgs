#!/bin/bash

# $1 is the path to the JUnit XML result file passed by CMake/CTest
RESULT_FILE=$1
PACKAGE="mrs_msgs"

# Resolve absolute path to the package root (mrs_msgs/)
SCRIPT_DIR=$(cd "$(dirname "$0")" && pwd)
PACKAGE_SRC_ROOT=$(realpath "$SCRIPT_DIR/../..")

# Enter the package directory to scope the Git command
cd "$PACKAGE_SRC_ROOT"

# Fix for Docker/CI: Mark directory as safe to avoid "dubious ownership" errors
git config --global --add safe.directory "$(pwd)"

# Check status specifically for this folder ('.')
# Filter out 'ci_scripts' in case the CI initialized Git in the parent folder
CHANGES=$(git status --porcelain . | grep -v "ci_scripts")

if [ -z "$CHANGES" ]; then
    echo "[OK] $PACKAGE source directory is clean."
    PASSED=true
else
    echo "[FAIL] Uncommitted changes found in $PACKAGE:"
    echo "$CHANGES"
    PASSED=false
fi

# Always generate the XML result file so Colcon/CTest can report the failure
if [ -n "$RESULT_FILE" ]; then
    mkdir -p "$(dirname "$RESULT_FILE")"
    num_fails=$([ "$PASSED" = true ] && echo "0" || echo "1")
    
    cat <<EOF > "$RESULT_FILE"
<?xml version="1.0" encoding="UTF-8"?>
<testsuites>
  <testsuite name="test_git_clean" tests="1" failures="$num_fails" errors="0">
    <testcase name="git_status_clean" classname="$PACKAGE">
      $(if [ "$PASSED" = false ]; then echo "<failure message='Uncommitted files in $PACKAGE: $CHANGES' />"; fi)
    </testcase>
  </testsuite>
</testsuites>
EOF
fi

# Exit with non-zero code if changes were found
[ "$PASSED" = true ] && exit 0 || exit 1
