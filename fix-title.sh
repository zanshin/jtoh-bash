#! /bin/bash
set -e
set -o pipefail

# fix-title.sh
#
# Fix title so the are enclosed by "
#

# Title ideal: "This is my title"
neuetitle=$(echo "$1" | tr '"' ' ' | awk '{$1 = ""; print "\042"$0"\042"}' | sed 's/" /"/')
printf "title: %s" "$neuetitle"

exit 0
