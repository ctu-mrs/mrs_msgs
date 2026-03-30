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

if [ "$PASSED" = true ]; then exit 0; else exit 1; fi
