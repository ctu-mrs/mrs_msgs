#!/bin/bash

# Define color codes
RESET='\033[0m' # Reset color
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'

# Override log function
log() {
    local color="$1" # First argument is the color
    shift            # Shift arguments to get the actual message

    case "$color" in
        red) color=$RED ;;
        green) color=$GREEN ;;
        yellow) color=$YELLOW ;;
        blue) color=$BLUE ;;
        magenta) color=$MAGENTA ;;
        cyan) color=$CYAN ;;
        white) color=$WHITE ;;
        reset) color=$RESET ;; # Reset to default
        *) color=$RESET ;;     # Default to no color if invalid
    esac

    # Print the message with the selected color
    /bin/echo -e "${color}$*${RESET}"
}

# Function to traverse directories and edit .msg and .srv files
process_files() {
    local dir="$1" # The directory to start traversal from
    local type="$2"

    if [ ! -d "$dir" ]; then
        log red "Error: $dir is not a valid directory."
        return 1
    fi

    log yellow "Traversing directory: $dir"

    # Use find to locate .msg files and process them
    find "$dir" -type f -name "*.$type" | while read -r file; do
        log yellow "Processing file: $file"

        # Example edit: Append the current date to each .msg file
        sed -i '/^#/! s/^time/builtin_interfaces\/Time/g' "$file"
        sed -i '/^#/! s/^Header/std_msgs\/Header/g' "$file"
        sed -E -i '/^#/! s/[[:space:]]([A-Z])([^[:space:]]*)/\L \1\2/g' "$file"
        /usr/bin/vim -E -s -c "%s/\s\+$//g" -c "wqa" -- "$file"
    done

    log green "Traversal and editing complete."
}

### Script starts here

# get the path to this script
MY_PATH=`dirname "$0"`
MY_PATH=`( cd "$MY_PATH" && pwd )`
cd "$MY_PATH"

ROS1_MSGS_LOCATION="$HOME/work/mrs/mrs_msgs"

# clean old msgs

log yellow "Cleaning old messages for ROS2"
rm -rf $MY_PATH/msg/*
rm -rf $MY_PATH/srv/*

# copy msgs

ROS1_MSGS_PATH="$ROS1_MSGS_LOCATION/msg"

log green "Copying msgs from ROS1 location"
cp -r $ROS1_MSGS_PATH $MY_PATH

# copy srvs

ROS1_SRVS_PATH="$ROS1_MSGS_LOCATION/srv"

log green "Copying srvs from ROS1 location"
cp -r $ROS1_SRVS_PATH $MY_PATH

# postproess message files

log yellow "Postprocessing msg files to correct format"
process_msg_files $MY_PATH/msg msg
log yellow "Postprocessing srv files to correct format"
process_msg_files $MY_PATH/srv srv

# print sections for CMakeLists.txt

log blue "Generating resultant msg_list.txt file for easier include in CMakeLists.txt"
FILE_LIST=$(find "$MY_PATH/msg" -type f -name "*.msg")
OUT_FILE="msg_list.txt"
rm -f $OUT_FILE

echo "# This file is generated, do NOT modify it by hand" >> $OUT_FILE

echo "
set(msg_files" >> $OUT_FILE
for file in $FILE_LIST; do
  echo "  ${file#*"mrs_msgs/"}" >> $OUT_FILE
done
echo ")" >> $OUT_FILE

log blue "Generating resultant srv_list.txt file for easier include in CMakeLists.txt"
FILE_LIST=$(find "$MY_PATH/srv" -type f -name "*.srv")
OUT_FILE="srv_list.txt"
rm -f $OUT_FILE

echo "# This file is generated, do NOT modify it by hand" >> $OUT_FILE
echo "
set(srv_files" >> $OUT_FILE
for file in $FILE_LIST; do
  echo "  ${file#*"mrs_msgs/"}" >> $OUT_FILE
done
echo ")" >> $OUT_FILE

log green "Successfully exported msg and srv files to ROS2"