#!/bin/bash
set -e

## --------------------------------------------------------------
## |                    1. Environment Setup                    |
## --------------------------------------------------------------
echo "Setting up ROS 2 documentation environment..."

# Add MRS PPA and install rosdoc2
curl -sl https://ctu-mrs.github.io/ppa2-stable/add_ros_ppa.sh | bash
sudo apt-get -y install python3-rosdoc2

## --------------------------------------------------------------
## |                 2. Documentation Generation                |
## --------------------------------------------------------------
echo "Running interface flattening and rosdoc2..."

# Execute the local staging script to handle nested .msg/.srv folders
# This script copies flattened interfaces to /tmp for rosdoc2 compatibility
./scripts/generate_docs.sh

## --------------------------------------------------------------
## |                  3. Post-Processing                        |
## --------------------------------------------------------------
echo "Organizing output for deployment..."

# Extract project name from CMakeLists.txt (e.g., project(mrs_msgs) -> mrs_msgs)
# This identifies the subdirectory name created by rosdoc2
line=$(grep "project(.*)" CMakeLists.txt -o)
tmp=${line:8}
proj_name=${tmp:0:${#tmp}-1}

# Move the package-specific folder to a generic 'html' folder for CI hosting
if [ -d "doc/$proj_name" ]; then
    echo "Moving doc/$proj_name to doc/html"
    mv "doc/$proj_name" doc/html
else
    echo "Warning: Expected documentation folder 'doc/$proj_name' not found."
    exit 1
fi

echo "Documentation process complete."
