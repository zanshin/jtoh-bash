#! /bin/bash
set -e
set -o pipefail

# jtoh.sh
#
# Read files with Jekyll style YAML headers and "clean them" so that Hugo
# conversion works.
#

echo "Starting clean up..."

BEFORE="$HOME/code/jtoh/before"
AFTER="$HOME/code/jtoh/after"
filetotal=$(ls -1 "$BEFORE" | wc -l)
filecount=1

cd "$BEFORE"
for filename in *; do

  "$HOME/code/jtoh/processpost.sh" "$filename" > "$AFTER"/"$filename"
  echo -ne "Processing file $filecount of $filetotal \r"
  ((filecount++))

done

echo -e "\n\n\n... and done."
exit 0
