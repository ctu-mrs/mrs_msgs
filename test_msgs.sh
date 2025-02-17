#!/bin/bash

# Get the list of all active topics with their types
msg_types=$(ros2 interface package mrs_msgs -m)
count=0
msg_count=$(echo $msg_types | grep -o "\bmrs_msgs\b" | wc -l)

# Loop through each topic and its type
while read -r line; do
    (ros2 topic hz /test_msg) &

    # Display the topic and its type
    echo "Publishing to topic: /test_msg with message type: $line"
    invalid=$(ros2 topic pub -t 2 /test_msg "$line" 2>&1)

    if [[ "$invalid" == *"invalid"* ]]; then
        echo "$line does not exist"
    else
        let count++
    fi

    pkill -f "ros2 topic hz"
done <<< $msg_types

echo "Tested msgs: $count"
if [[ $count -eq $msg_count ]]; then
    echo "Test successful"
else
    echo "Test failed, some msgs are not valid"
    exit 1
fi

exit 0
