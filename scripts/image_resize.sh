#!/bin/bash

FOLDER_PATH="./resize"

if [ -d "$FOLDER_PATH" ]; then
  echo "Folder already exists."
else
  mkdir -p "$FOLDER_PATH"
  echo "Folder created at $FOLDER_PATH."
fi

echo 'resizing images...'

for f in $(find . -name '*.png' -or -name '*.jpg' -or -name '*.jpeg' -or -name '*.JPEG' -or -name '*.JPG' -or -name '*.webp' ); do 
   magick $f -resize 1000 ${FOLDER_PATH}/${f}
done
