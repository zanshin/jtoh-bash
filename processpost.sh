#! /bin/bash
set -e
set -o pipefail

# processpost.sh
#
# Processes file passed to it looking for expected YAML front matter items.
#
# Each post must have a title, a date, and a draft status (true|false).
# All other meta data is kept as is.
#
# Ideal front matter should look something like this.
#
#  ---
#  layout: post
#  title: "Some pithy title here"
#  draft: false
#  date: YYYY-MM-DDThh:mm-05:00
#  categories: foo bar
#  link: false | https://example.co
#  ---
#
# All other lines, i.e., the post's content, is passed through to the output
# file.
#

if [[ $# -ne 1 ]]; then
  echo "Usage: $0 <filename>"
  exit 2
fi

dashes="---"
while IFS= read -r line
do

  shopt -s extglob
  case "$line" in
    layout:*)
      printf "%s\n" "$line"
      ;;
    title:*)
      newtitle=$("$HOME/code/jtoh/fix-title.sh" "$line")
      printf "%s\n" "$newtitle"
      newdraft=$("$HOME/code/jtoh/add-draft.sh")
      printf "%s\n" "$newdraft"
      ;;
    date:*)
      newdate=$("$HOME/code/jtoh/fix-date.sh" "$line")
      printf "%s\n" "$newdate"
      ;;
    categories:*)
      printf "%s\n" "$line"
      result+=" categories"
      ;;
    link:*)
      newlink=$("$HOME/code/jtoh/fix-link.sh" "$line")
      printf "%s\n" "$newlink"
      ;;
    comments:*)
      # Toss the comment meta data out
      ;;
    "$dashes"*)
      printf "%s\n" "$dashes"
      ;;
    *)
      # pass through all other lines
      printf "%s\n" "$line"
      ;;
  esac

done < "$1"

exit 0
