# Introduction
These scripts convert my Jekyll sites to Hugo. Since the content in my sites spans 20 years and
multiple blogging systems, there is some cruft that the existing Jekyll to Hugo conversion scripts
don't handle.

This project was created in part as an exercise in learning more about Bash scripting.

## Installation
Clone this repository.

Create two directories, one for the Jekyll posts to be migrated, called `before`, and one for the
migrated posts, called `after`.

Make a **copy** of all of the posts to be converted and place them in the `before` directory.

## Usage
Edit the `jtoh.sh` script and configure the paths to the `before` and `after` directories
appropriately.

Execute `jtoh.sh`. It in turns executes the other scripts as necessary. As each posting is migrated
it is placed in the `after` directory. AS the files are processed a counter is displayed to show
progress.

## Scripts
The following scripts are included.

### jtoh.sh
This is the main script. It reads in all the files in the `before` directory, processes them, and
puts the migrated files in the `after` directory.

### processpost.sh
This script processes each line of a post. The metadata entries in the YAML front matter are cleaned
up via the `fix-*` scripts.

The following scripts are utilized by `processpost.sh`.

* fix-title.sh - Encloses the title in quotes
* fix-date.sh - Ensures that all dates are in the proper format
* fix-link.sh - The metadata for link posts is either `false` or a URL
* add-draft.sh - Inserts a `draft: false` metadata line for each post

### fix-title.sh
The `fix-title.sh` script makes sure that all titles are enclosed in quotes

### fix-date.sh
The `fix-data.sh` formats the posting's publish date and time in a consistent format. All dates will
be YYYY-MM-DDTHH:MM-05:00. In the case of my older posts, many didn't have times; and none had the
UTC offset.

### fix-link.sh
The `fix-link.sh` script sets the link metadata entry to be `false` if there is no URL. My homegrown
link post system was not consistent in setting this tag properly.

### add-draft.sh
This script inserts a new metadata line in to the YAML front matter. Hugo expects a `draft: true` or
`draft: false` entry. As the migrating posts are all already published, the new line is set to
`false`.

## Caveats
These scripts were written for my sites. One had always been a Jekyll-based site, the other had
transitioned from hand-coded to Blogger to MoveableType to WordPress to Octopress and finally to
Jekyll. Along the way parts of it got rather crufty. These scripts work for my postings. They are
opinionated. They will almost certainly require modifications to work for your site(s).

## License
[Licensed](LICENSE.md) under the MIT License.
