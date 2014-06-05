#!/bin/sh
if ! ( [ $# = 1 ] || [ $# = 2 ] ); then
	echo usage: $0 file.flv file.mp3
	exit 1
fi

[ $# = 1 ] && output=${1%%\.*}.wma || output=$2

avconv -i "$1" -vn -acodec wmav2 "$output"
