#!/bin/bash

PACKAGE="mrs_msgs"
# Filter to ensure we only test things in the standard msg/srv/action format
interfaces=$(ros2 interface package "$PACKAGE" | sed 's/^[[:space:]]*//' | grep -E "/(msg|srv|action)/")

if [ -z "$interfaces" ]; then
    echo "Error: No interfaces found for package $PACKAGE. Is it sourced?"
    exit 1
fi

total_count=$(echo "$interfaces" | wc -l)
passed_count=0
failures=""

echo "Checking $total_count interfaces in $PACKAGE..."
echo "-----------------------------------------------"

while read -r interface; do
    if ros2 interface show "$interface" > /dev/null 2>&1; then
        echo "[OK]   $interface"
        ((passed_count++))
    else
        echo "[FAIL] $interface (could not load definition)"
        failures="$failures $interface"
    fi
done <<< "$interfaces"

echo "-----------------------------------------------"
echo "Result: $passed_count / $total_count passed."

# --- FINAL EXIT ---
if [ "$passed_count" -eq "$total_count" ]; then
    echo "SUCCESS: All messages and services are valid."
    exit 0
else
    echo "FAILURE: Some interfaces are broken or missing type support."
    exit 1
fi
