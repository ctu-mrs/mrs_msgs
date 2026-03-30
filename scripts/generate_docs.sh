#!/bin/bash
set -e

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
PKG_ROOT="$(dirname "$SCRIPT_DIR")"
WS_ROOT="$(dirname "$(dirname "$PKG_ROOT")")"
BUILD_INTERFACES="$WS_ROOT/build/mrs_msgs/gen_interfaces"
STAGING_DIR="/tmp/mrs_msgs_doc_staging"

cleanup() {
    if [ -d "$STAGING_DIR" ]; then
        rm -rf "$STAGING_DIR"
    fi
}

trap cleanup EXIT

if [ ! -d "$BUILD_INTERFACES" ]; then
    echo "Error: Build directory not found at $BUILD_INTERFACES"
    exit 1
fi

rm -rf "$STAGING_DIR"
mkdir -p "$STAGING_DIR"

cp "$PKG_ROOT/package.xml" "$STAGING_DIR/"
cp "$PKG_ROOT/rosdoc2.yaml" "$STAGING_DIR/"

# Copy all subdirectories (msg, srv, action, etc.) from build_interfaces
for dir in "$BUILD_INTERFACES"/*/; do
    if [ -d "$dir" ]; then
        cp -rL "$dir" "$STAGING_DIR/"
    fi
done

rosdoc2 build --package-path "$STAGING_DIR" --output-directory "$PKG_ROOT/doc"

echo "Success: Docs generated in $PKG_ROOT/doc"
