#!/usr/bin/env sh
if [[ $# = 0 ]]; then
  echo "$0 [-r] perf-record-args..." >&2
  echo '  -r: remove previous recording file' >&2
  exit 1
fi

FLAMEGRAPH=~/game/FlameGraph
TMP="${TMPDIR:-/tmp}"
SVG="$TMP"/perf.svg
DATA="$TMP"/perf.data
if [[ "$1" = "-r" ]]; then
  rm "$DATA" 2>/dev/null ||:
  shift
fi
perf record --call-graph dwarf -o"$DATA" "$@"
perf script -i"$DATA" |
  "$FLAMEGRAPH"/stackcollapse-perf.pl |
  "$FLAMEGRAPH"/flamegraph.pl > "$SVG"
echo "$SVG" >&2
