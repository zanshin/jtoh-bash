#! /bin/bash
set -e
set -o pipefail

# fix-date.sh
#
# Fix dates to have consistent format
#

# Date ideal: YYYY-MM-DDTHH:MM:SS-05:00
ymd=$(echo "$1" | awk '{print $2}' | sed "s/\"//g")

# Deal with singleton months (2020-9-30)
ymd=$(echo "$ymd" | sed "s/-\([0-9]\)-/-0\1-/")

# Deal with singleton days (2020-09-4)
ymd=$(echo "$ymd" | sed "s/-\([0-9]\)/-0\1"/)

# Get HH:MM, if they exist, produce HH:MM:SS regardless
hm=$(echo "$1" | awk '{print $3}' | sed "s/\"//g")
if [[ -z "$hm" ]]; then
  hms=$(date +'%H:%M:%S')
else
  hms="$hm":"$(date +'%S')"
fi

printf "date: %sT%s-05:00" "$ymd" "$hms"

exit 0
