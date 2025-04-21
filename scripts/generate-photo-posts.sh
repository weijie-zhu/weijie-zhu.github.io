#!/bin/bash

# Directory containing your photos
PHOTOS_DIR="assets/images"
# Directory for markdown files
MARKDOWN_DIR="content/view"

# Create directories if they don't exist
mkdir -p "$PHOTOS_DIR"
mkdir -p "$MARKDOWN_DIR"

# Process each jpg file
for photo in "$PHOTOS_DIR"/*.jpg; do
    if [ -f "$photo" ]; then
        # Get filename without path and extension
        filename=$(basename "$photo" .jpg)
        
        # Extract date and location from filename
        # Example: 20240911广州佛山-pdm_4248.jpg
        date_str=${filename:0:8}  # Get YYYYMMDD
        formatted_date="${date_str:0:4}-${date_str:4:2}-${date_str:6:2}"
        
        # Extract location (everything between date and first dash)
        location=${filename:8}
        location=${location%%-*}
        
        # Create markdown filename (use original filename to maintain uniqueness)
        markdown_file="$MARKDOWN_DIR/${filename}.md"
        
        # Create markdown file
        cat > "$markdown_file" << EOF
---
title: "${location} View"
date: ${formatted_date}
location: "${location}"
description: "A scene from ${location}"
image: "images/$(basename "$photo")"
---
EOF
        
        echo "Created markdown file for $filename"
    fi
done

echo "Done! Please review and update the descriptions in the generated files." 