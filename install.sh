#!/bin/bash
FILES=*.apk
DEVICE=""

if [ -n "$1" ]; then
    DEVICE="-s $1"
    echo $DEVICE
fi

for f in $FILES
do
  echo "Processing $f file..."
  output=$(adb $DEVICE install -r $f)
  echo $output
done
