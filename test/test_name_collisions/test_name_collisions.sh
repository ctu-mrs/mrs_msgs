#!/bin/bash

PACKAGE="mrs_msgs"
RESULT_FILE=$1

SOURCE_DIR=$(cd "$(dirname "$0")/../../" && pwd)

SEARCH_PATHS=""
for dir in "msg" "srv" "action"; do
    if [ -d "$SOURCE_DIR/$dir" ]; then
        SEARCH_PATHS="$SEARCH_PATHS $SOURCE_DIR/$dir"
    fi
done

echo "Checking for filename collisions in: $SEARCH_PATHS"
echo "-----------------------------------------------"

if [ -z "$SEARCH_PATHS" ]; then
    echo "[OK] No interface directories found. Nothing to collide!"
    PASSED=true
else
    DUPLICATES=$(find $SEARCH_PATHS -type f \( -name "*.msg" -o -name "*.srv" -o -name "*.action" \) -printf "%f\n" | sort | uniq -d)

    if [ -z "$DUPLICATES" ]; then
        echo "[OK] All interface names are unique."
        PASSED=true
    else
        echo "[FAIL] Filename collisions detected!"
        echo "$DUPLICATES"
        PASSED=false
    fi
fi

# --- XML GENERATION ---
if [ -n "$RESULT_FILE" ]; then
    mkdir -p "$(dirname "$RESULT_FILE")"
    num_fails=$([ "$PASSED" = true ] && echo "0" || echo "1")
    cat <<EOF > "$RESULT_FILE"
<?xml version="1.0" encoding="UTF-8"?>
<testsuites>
  <testsuite name="test_name_collisions" tests="1" failures="$num_fails" errors="0">
    <testcase name="unique_filenames" classname="$PACKAGE">
      $(if [ "$PASSED" = false ]; then echo "<failure message='Duplicate filenames found: $DUPLICATES' />"; fi)
    </testcase>
  </testsuite>
</testsuites>
EOF
fi

if [ "$PASSED" = true ]; then exit 0; else exit 1; fi
