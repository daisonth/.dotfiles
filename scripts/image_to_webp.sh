#!/bin/bash

FOLDER_PATH="./webp"

if [ -d "$FOLDER_PATH" ]; then
  echo "Folder already exists."
else
  mkdir -p "$FOLDER_PATH"
  echo "Folder created at $FOLDER_PATH."
fi

echo 'Converting all .png, .jpg, and .jpeg files to .webp...'

for f in $(find . -name '*.png' -or -name '*.jpg' -or -name '*.jpeg' -or -name '*.JPEG' -or -name '*.JPG' ); do 
    if [ ! -f "${f%.*}.png" ]; then
        cwebp -q 60 $f -o ${FOLDER_PATH}/${f%.*}.png
    fi
done
