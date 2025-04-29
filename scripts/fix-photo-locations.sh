#!/bin/bash

# This script fixes some of the markdown files with incomplete location information

# Update specific files with better location information

# Fix 20230218-5.md
sed -i '' 's/title: "5 View"/title: "Shanghai View"/g' "content/view/20230218-5.md"
sed -i '' 's/location: "5"/location: "Shanghai"/g' "content/view/20230218-5.md"
sed -i '' 's/description: "A scene from 5"/description: "A scene from Shanghai"/g' "content/view/20230218-5.md"

# Fix files with just numbers in the location
sed -i '' 's/title: "11 View"/title: "Shanghai View"/g' "content/view/20231015-11.md"
sed -i '' 's/location: "11"/location: "Shanghai"/g' "content/view/20231015-11.md"
sed -i '' 's/description: "A scene from 11"/description: "A scene from Shanghai"/g' "content/view/20231015-11.md"

sed -i '' 's/title: "9 View"/title: "Shanghai View"/g' "content/view/20231015-9.md"
sed -i '' 's/location: "9"/location: "Shanghai"/g' "content/view/20231015-9.md"
sed -i '' 's/description: "A scene from 9"/description: "A scene from Shanghai"/g' "content/view/20231015-9.md"

# Fix files with just numbers for Lombok images
sed -i '' 's/title: "4 View"/title: "Lombok View"/g' "content/view/20250104Lombok-4.md"
sed -i '' 's/location: "4"/location: "Lombok"/g' "content/view/20250104Lombok-4.md"
sed -i '' 's/description: "A scene from 4"/description: "A scene from Lombok"/g' "content/view/20250104Lombok-4.md"

echo "Fixed location information in markdown files."