#!/bin/bash

if [ -z "$1" ]; then
  echo "Please provide a bash file to convert."
  exit 1
fi

# Read the bash file
content=$(cat "$1")

# Escape special characters for a one-liner (", $, and \)
escaped_content=$(echo "$content" | sed 's/\\/\\\\/g' | sed 's/"/\\"/g' | sed 's/\$/\\\$/g')

# Output the git config command
echo "git config --global alias.${1%.sh} '!sh -c \"$escaped_content\"'"