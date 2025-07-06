#!/bin/bash

# Set desired thumbnail width (in pixels)
THUMB_WIDTH=300

# Loop through all PNG files
for file in *.png; do
    # Create JPG filename
    jpg_file="${file%.png}.jpg"
    # Convert PNG to JPG
    sips -s format jpeg "$file" --out "$jpg_file"
    
    # Create thumbnail filename
    thumb_file="${file%.png}_thumb.jpg"
    # Create thumbnail from JPG
    sips -Z "$THUMB_WIDTH" "$jpg_file" --out "$thumb_file"

    echo "Converted $file ? $jpg_file and created thumbnail ? $thumb_file"
done
