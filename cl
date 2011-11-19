#!/bin/sh

# this script count lines of text files recursively
# Some file extensions are considered and currently it's needed to change the script to add others
# How to use:
# cl DIR
# will count, recursively, all the lines of text (or code) of files within DIR


export y=0
for x in $(find $1  | grep -i -E \("\.c|\.pc|\.h|\.sql"\))
do
	export k=$(wc -l  $x | cut -f 1 -d " ")
	export y=$(echo $y + $k | bc)
done

echo $y
