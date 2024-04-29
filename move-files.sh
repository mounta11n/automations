#!/bin/bash

# Set the source directory and the destination directory
src_dir=$HOME/Schreibtisch
dst_dir=$HOME/obsidian/neogenesis

# Loop through all Markdown files in the source directory
for file in "$src_dir"/*.md; do
  # Check if the file has the xattr 'user.tags' with value 'tomove'
  if getfattr -d -m $file | grep -q "user.xdg.tags=movetoobsidian"; then
    # Move the file to the destination directory
    mv "$file" "$dst_dir"
  fi
done 
