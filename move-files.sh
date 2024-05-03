#!/bin/bash

# Set the source directory and the destination directory
src_dir="$HOME/Schreibtisch"
dst_dir="$HOME/obsidian/neogenesis"

# Loop through all Markdown files in the source directory
for file in "$src_dir"/*.md; do
  # Check if the file has the xattr 'user.xdg.tags' with value 'movetoobsidian'
  # FYI: In general you would only check for 'user.tags' with values like 'move', 'moveto', 'delete' or somehting
  # In this case I'm using 'user.xdg.tags' since this can be shown in dolphin file manager by default in an own column
  # (As well as 'user.xdg.comment'). And the value 'movetoobsidian' is just a very personalized example.
  if getfattr -n user.xdg.tags -e text "$file" | grep -q "movetoobsidian"; then
    # Move the file to the destination directory
    mv "$file" "$dst_dir"
  fi
done
