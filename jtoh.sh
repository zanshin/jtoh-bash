#! /bin/bash
set -e
set -o pipefail

# jtoh.sh
#
# Read files with Jekyll style YAML headers and "clean them" so that Hugo
# conversion works.
#

echo "Starting migration..."

BEFORE="$HOME/code/jtoh/before"
AFTER="$HOME/code/jtoh/after"
filetotal=$(find "$BEFORE" -type f | wc -l)
filecount=1

cd "$BEFORE"
for filename in *; do

  "$HOME/code/jtoh/processpost.sh" "$filename" > "$AFTER"/"$filename"
  echo -ne "Processing file $filecount of $filetotal \r"
  ((filecount++))

done

echo -e "\n\nMigration finished."
exit 0
