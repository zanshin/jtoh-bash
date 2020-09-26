#! /bin/bash
set -e
set -o pipefail

# fix-yt-shortcode.sh
#
# Fix youtube short codes to be the Hugo style.
# {{< ...>}} not {% ... %}
#

printf "%s" $(echo "$1" | sed 's/{%/{{</' | sed 's/%}/>}}/')

exit 0
