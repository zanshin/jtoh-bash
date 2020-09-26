# Introduction
These scripts convert my Jekyll sites to Hugo. Since the content in my sites spans 20 years and
multiple blogging systems, there is some cruft that the existing Jekyll to Hugo conversion scripts
don't handle.

This project was created in part as an exercise in learning more about Bash scripting.

## jtoh.sh
This is the main script. It reads in all the files in the `before` directory, processes them, and
puts the migrated files in the `after` directory.

## processpost.sh
This script processes each line of a post. The metadata entries in the YAML front matter are cleaned
up: dates are standarized, title are enclosed in quotes, and a `draft:` metadata line is added.

## fix-*
The fix scripts do just that. They fix, clean up, format some aspect of the post content.


