#!/usr/bin/env bash
ems_bin_path="$EMSDK/upstream/emscripten"
ems_self=$(basename "$0")
ems_cmd="$1"
if [ $# -eq 0 ]; then
  echo "Usage: $ems_self executable [arguments]"
  exit 1
fi
if [ ! -f "$ems_bin_path/$ems_cmd" ]; then
  echo "Error: $ems_cmd is not a valid executable in $ems_bin_path"
  exit 2
fi
shift
"$ems_bin_path/$ems_cmd" "$@"
