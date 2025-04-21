#!/bin/bash

# Directory containing your photos
PHOTO_DIR="assets/images"

# Create the scripts directory if it doesn't exist
mkdir -p scripts

# Function to convert filename to title
filename_to_title() {
    # Remove extension, replace hyphens with spaces, capitalize words
    echo "$1" | sed 's/\.[^.]*$//' | sed 's/-/ /g' | awk '{for(i=1;i<=NF;i++)sub(/./,toupper(substr($i,1,1)),$i)}1'
}

# Create content for each image
for image in "$PHOTO_DIR"/*.jpg; do
    if [ -f "$image" ]; then
        # Get filename without path
        filename=$(basename "$image")
        # Get filename without extension
        name_no_ext="${filename%.*}"
        # Convert filename to title
        title=$(filename_to_title "$name_no_ext")
        # Create markdown file
        cat > "content/view/${name_no_ext}.md" << EOF
---
title: "${title}"
date: $(date +%Y-%m-%d)
location: "Location Name"
description: "Add description here"
image: "images/${filename}"
---
EOF
        echo "Created post for ${filename}"
    fi
done

echo "Done creating photo posts!" 