#! /bin/bash
set -e
set -o pipefail

# fix-date.sh
#
# Fix dates to have consistent format
#

# Date ideal: YYYY-MM-DDTHH:MM:SS-05:00
# Find the YYYY-MM-DD date and fix singleton months and days
ymd=$(echo "$1" | awk '{print $2}' | sed "s/\"//g" | sed "s/-\([0-9]\)-/-0\1-/" | sed "s/-\([0-9]\)$/-0\1/")

# Get HH:MM, if they exist, produce HH:MM:SS regardless
hm=$(echo "$1" | awk '{print $3}' | sed "s/\"//g")
if [[ -z "$hm" ]]; then
  hms=$(date +'%H:%M:%S')
else
  hms="$hm":"$(date +'%S')"
fi

printf "date: %sT%s-05:00" "$ymd" "$hms"

exit 0
