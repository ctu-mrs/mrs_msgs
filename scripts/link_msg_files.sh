#!/bin/bash
# Get the root directory (one level up from scripts/)
ROOT_DIR=$(cd "$(dirname "$0")/.." && pwd)

# We loop through every argument passed to the script
for FILE_PATH in "$@"; do
    # Only process if the file exists
    if [ -f "$ROOT_DIR/$FILE_PATH" ]; then
        # Determine if it's msg, srv, or action based on path
        DIR_NAME=$(echo "$FILE_PATH" | cut -d'/' -f1) # e.g., "msg"
        
        # Get the filename (e.g., BoolStamped.msg)
        BASE_NAME=$(basename "$FILE_PATH")
        
        # Navigate to the root of that category (e.g., mrs_msgs/msg/)
        cd "$ROOT_DIR/$DIR_NAME"
        
        # Create the symlink using the ./ prefix you liked
        # We find the relative path from the category root to the actual file
        RELATIVE_TARGET=$(realpath --relative-to="." "$ROOT_DIR/$FILE_PATH")
        ln -sf "./$RELATIVE_TARGET" "$BASE_NAME"
    fi
done
