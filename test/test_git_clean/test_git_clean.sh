#!/bin/bash

RESULT_FILE=$1
PACKAGE="mrs_msgs"

# 1. Get the directory where THIS script is actually located in the source
# Since the script is in src/mrs_msgs/test/test_git_clean/test_git_clean.sh,
# we go up 3 levels to find the package root.
SCRIPT_DIR=$(cd "$(dirname "$0")" && pwd)
PACKAGE_SRC_ROOT=$(realpath "$SCRIPT_DIR/../..")

# 2. Use -C to force Git to look at the package source directory
# This works regardless of where the build folder is located.
GIT_ROOT=$(git -C "$PACKAGE_SRC_ROOT" rev-parse --show-toplevel 2>/dev/null)

if [ -z "$GIT_ROOT" ]; then
    echo "[FAIL] Could not find a git repository for $PACKAGE_SRC_ROOT"
    PASSED=false
else
    # 3. Check status only for this specific package to avoid unrelated noise
    CHANGES=$(git -C "$GIT_ROOT" status --porcelain "$PACKAGE_SRC_ROOT")

    if [ -z "$CHANGES" ]; then
        echo "[OK] Git workspace for $PACKAGE is clean."
        PASSED=true
    else
        echo "[FAIL] Uncommitted changes found in $PACKAGE:"
        echo "-----------------------------------------------"
        echo "$CHANGES"
        echo "-----------------------------------------------"
        PASSED=false
    fi
fi

# --- XML GENERATION (Keep this part the same) ---
if [ -n "$RESULT_FILE" ]; then
    mkdir -p "$(dirname "$RESULT_FILE")"
    num_fails=$([ "$PASSED" = true ] && echo "0" || echo "1")
    cat <<EOF > "$RESULT_FILE"
<?xml version="1.0" encoding="UTF-8"?>
<testsuites>
  <testsuite name="test_git_clean" tests="1" failures="$num_fails" errors="0">
    <testcase name="git_status_clean" classname="$PACKAGE">
      $(if [ "$PASSED" = false ]; then echo "<failure message='Uncommitted changes found in $PACKAGE' />"; fi)
    </testcase>
  </testsuite>
</testsuites>
EOF
fi

if [ "$PASSED" = true ]; then exit 0; else exit 1; fi
