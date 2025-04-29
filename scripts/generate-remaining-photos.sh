#!/bin/bash

# This script generates markdown files for images that don't have corresponding markdown files yet

# Directory containing your photos
PHOTOS_DIR="assets/images"
# Directory for markdown files
MARKDOWN_DIR="content/view"

# Create directories if they don't exist
mkdir -p "$PHOTOS_DIR"
mkdir -p "$MARKDOWN_DIR"

# Create markdown files for these specific images
declare -a images=(
  "20240926澳门凼仔-PDM_5724.jpg"
  "20241103-澳门hellokitty-1.jpg"
  "20241103-澳门hellokitty-3.jpg"
  "20250113KotaKinabalu-45.jpg"
  "20200606楼中剪影小幅.jpg"
  "20220902铁马冰河入梦来.jpg"
  "20221112日出.jpg"
  "20221112码头.jpg"
  "20230218-5.jpg"
  "20230713西岸美术馆夏令时 表演 zwjFLC05115.jpg"
  "20230805小学生书架捐书及肖像展导览-zwj-PS5_2128.jpg"
  "20230805小学生书架捐书及肖像展导览-zwj-PS5_2134.jpg"
  "20230815-上海西岸-PS5_3695.jpg"
  "20230815-上海西岸-PS5_3713.jpg"
  "20231015-11.jpg"
  "20231015-9.jpg"
  "20231015闵浦大桥摄协-人文-7.jpg"
  "20231024嘉兴游玩-97.jpg"
  "20231027世端乐队-100.jpg"
  "20231027世端乐队-101.jpg"
  "20231122黑吉辽-128.jpg"
  "20231122黑吉辽-262.jpg"
  "20231127哈尔滨-58.jpg"
  "202312encu-胶片.jpg"
  "20240331sakura_mingsai-38.jpg"
)

# Process each image
for image in "${images[@]}"; do
  if [ -f "$PHOTOS_DIR/$image" ]; then
    # Get filename without path and extension
    filename=$(basename "$image" .jpg)
    
    # Check if markdown file already exists
    if [ ! -f "$MARKDOWN_DIR/${filename}.md" ]; then
      # Extract date and location from filename
      # Handle different filename formats
      if [[ $filename =~ ^([0-9]{8})(.*)$ ]]; then
        date_str=${BASH_REMATCH[1]}  # Get YYYYMMDD
        formatted_date="${date_str:0:4}-${date_str:4:2}-${date_str:6:2}"
        
        # Extract location (everything after the date)
        location=${BASH_REMATCH[2]}
        # Remove any leading dash or hyphen
        location=${location#-}
        # Remove any trailing identifiers (like -PDM_xxxx)
        location=${location%%-*}
      else
        # If filename doesn't match the pattern, use a default date and the whole filename as location
        formatted_date="2023-01-01"
        location="$filename"
      fi
      
      # Create markdown file
      cat > "$MARKDOWN_DIR/${filename}.md" << EOF
---
title: "${location} View"
date: ${formatted_date}
location: "${location}"
description: "A scene from ${location}"
image: "images/${image}"
---
EOF
      
      echo "Created markdown file for $filename"
    else
      echo "Markdown file for $filename already exists"
    fi
  else
    echo "Image $image not found in $PHOTOS_DIR"
  fi
done

echo "Done! Please review and update the descriptions in the generated files."