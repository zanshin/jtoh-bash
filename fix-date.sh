#! /bin/bash
set -e
set -o pipefail

# fix-date.sh
#
# Fix dates to have consistent format
#

# Date ideal: YYYY-MM-DDTHH:MM:SS-05:00
ymd=$(echo "$1" | awk '{print $2}' | sed "s/\"//g")
hms=$(echo "$1" | awk '{print $3}' | sed "s/\"//g")
if [[ -z "$hms" ]]; then hms=$(date +'%H:%M'); fi
printf "date: %sT%s-05:00" "$ymd" "$hms"

exit 0
