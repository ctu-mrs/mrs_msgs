#!/bin/bash

# Get the list of all active topics with their types
msg_types=$(ros2 interface package mrs_msgs -m)
# msg_types="std_msgs/msg/String\n"
msg_count=$(echo $msg_types | wc -l)
count=0
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

echo "test count: $count, msg count: $msg_count"
if [[ $count -eq $msg_count ]]; then
    echo "Test successful"
else
    echo "Test failed, some msgs are not valid"
fi
exit 0
