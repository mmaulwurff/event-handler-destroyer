#!/bin/bash

set -e

#filename=build/event-handler-destroyer-$(git describe --abbrev=0 --tags).pk3
filename=build/event-handler-destroyer.pk3

rm  -f  "$filename"
zip -R0 "$filename" "*.md" "*.txt" "*.zs"

gzdoom -file "$filename" "$@"
