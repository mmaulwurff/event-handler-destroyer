#!/bin/bash

set -e

mkdir -p build

filename=build/event-handler-destroyer-$(git describe --abbrev=0 --tags).pk3

rm  -f  "$filename"
zip -R0 "$filename" "*.md" "*.txt" "*.zs"

gzdoom -file "$filename" "$@"
