#!/usr/bin/env sh
FLAMEGRAPH=~/game/FlameGraph
TMP="${TMPDIR:-/tmp}"
SVG="$TMP"/perf.svg
perf record --call-graph dwarf -o"$TMP/perf.data" "$@"
perf script -i"$TMP/perf.data" |
  "$FLAMEGRAPH"/stackcollapse-perf.pl |
  "$FLAMEGRAPH"/flamegraph.pl > "$SVG"
echo "$SVG" >&2
