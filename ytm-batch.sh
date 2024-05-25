#!/bin/bash

# check whether a file was passed as an argument
if [ $# -eq 0 ]; then
  echo "No file was passed as an argument"
  exit 1
fi

# save the file name in a variable
INPUT_FILE=$1

# check if the file exists
if [ ! -f "$INPUT_FILE" ]; then
  echo "The file $INPUT_FILE does not exist"
  exit 1
fi

# read the file line by line
while IFS= read -r line; do
  yt-dlp -x --audio-format mp3 --default-search auto "$line"
done < "$INPUT_FILE"
