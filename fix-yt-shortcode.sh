#! /bin/bash
set -e
set -o pipefail

# fix-yt-shortcode.sh
#
# Fix youtube short codes to be the Hugo style.
# {{< ...>}} not {% ... %}
#

awk '{printf "{{< %s %s >}}", $2, $3}' <<<"$1"

exit 0
