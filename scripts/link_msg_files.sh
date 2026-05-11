#!/bin/bash

# The first argument is now the TARGET base directory (e.g., build/mrs_msgs/gen_interfaces)
DEST_BASE=$1
shift 

# Get the root directory of the package
ROOT_DIR=$(cd "$(dirname "$0")/.." && pwd)

for FILE_PATH in "$@"; do
    # Only process if the file exists in source
    if [ -f "$ROOT_DIR/$FILE_PATH" ]; then
        # Determine category (msg, srv, or action)
        DIR_NAME=$(echo "$FILE_PATH" | cut -d'/' -f1)
        BASE_NAME=$(basename "$FILE_PATH")
        
        # Ensure the destination subdirectory exists in the BUILD folder
        mkdir -p "$DEST_BASE/$DIR_NAME"
        
        # Copy the file from Source Dir to Build Dir
        # Using copies instead of symlinks ensures proper installation
        SOURCE_FILE="$ROOT_DIR/$FILE_PATH"
        DEST_FILE="$DEST_BASE/$DIR_NAME/$BASE_NAME"
        
        cp -f "$SOURCE_FILE" "$DEST_FILE"
    fi
done
