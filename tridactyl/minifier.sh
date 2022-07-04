#/bin/bash

set -e

if (( $# != 1 )); then
  echo "$0 file.js" >&2
  exit 1
fi

curl -X POST -s --data-urlencode 'input='"$(<"$1")" https://www.toptal.com/developers/javascript-minifier/api/raw
