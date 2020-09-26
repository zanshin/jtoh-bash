#! /bin/bash
set -e
set -o pipefail

# fix-link.sh
#
# Fix link so the if there is no URL, the value is set to false
#

# Link ideal: link: false or link: http(s)://example.com
shopt -s extglob
case "$1" in
   *http*)
    neuelink="$1"
    ;;
  *)
    neuelink="link: false"
    ;;
esac

printf "%s" "$neuelink"

exit 0
