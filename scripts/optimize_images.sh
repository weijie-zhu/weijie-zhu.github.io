#!/bin/bash

# Check if ImageMagick is installed
if ! command -v convert &> /dev/null; then
    echo "ImageMagick is not installed. Please install it first:"
    echo "brew install imagemagick"
    exit 1
fi

# Directory containing original photos
INPUT_DIR="original_photos"
# Directory for processed photos
OUTPUT_DIR="assets/images"

# Create directories if they don't exist
mkdir -p "$INPUT_DIR" "$OUTPUT_DIR"

# Process each image
for image in "$INPUT_DIR"/*.jpg; do
    if [ -f "$image" ]; then
        filename=$(basename "$image")
        echo "Processing $filename..."
        
        # Resize and optimize image
        # Max width 2000px, quality 85%
        convert "$image" -resize "2000x>" -quality 85 -strip "$OUTPUT_DIR/$filename"
        
        echo "Optimized $filename"
    fi
done

echo "Done optimizing images!"
echo "Original photos are preserved in $INPUT_DIR"
echo "Optimized photos are in $OUTPUT_DIR" 