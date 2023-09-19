#!/bin/bash

mkdir output

for FILE in *audio*
do
	BASENAME="$(echo $FILE | cut -d- -f1)"
	VIDEO_FILENAME=$(ls "$BASENAME"* | grep -wv audio)
	
	echo "FILENAME: $FILE, VIDEO FILENAME: $VIDEO_FILENAME" OUT: $BASENAME.mp4 >> summary.txt

	ffmpeg -i "$VIDEO_FILENAME" -i "$FILE" -c copy "output/$BASENAME.mp4"
	
done
