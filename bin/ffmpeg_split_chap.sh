#!/usr/bin/env bash

# Author: http://crunchbang.org/forums/viewtopic.php?id=38748#p414992
# m4bronto

peval()
{
  echo "$@"
  "$@"
}

while (( $# > 0 )); do
  ffmpeg -i "$1" 2>&1 >/dev/null | while read -r first _ _ start _ end; do
    if [[ $first = Chapter ]]; then
      read  # discard line with Metadata:
      read _ _ chapter
      #echo "$chapter"

      #peval ffmpeg -vsync 2 -i "$1" -ss "${start%?}" -to "$end" -vn -ar 44100 -ac 2 -ab 128  -f mp3 "$chapter.mp3"
      peval ffmpeg -i "$1" -ss "${start%?}" -to "$end" -vn "$chapter.mp3"
    fi
  done

  shift
done
