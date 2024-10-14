#!/bin/bash

remove_duplicates="cat"
reverse=""
count=5  # Default to 5

while getopts "run:" opt; do
  case $opt in
    r) reverse="reverse";;
    u) remove_duplicates="perl -ne 'print unless \$seen{\$_}++'";;
    n) count=$OPTARG;;
  esac
done

shift $((OPTIND -1))

git reflog | grep -E "checkout: moving from" | sed -E "s/.*checkout: moving from [^ ]+ to ([^ ]+).*/\\1/" | eval "$remove_duplicates" | eval "perl -e '@lines=<>; print @lines[0..($count-1)]'" | eval "perl -e 'print ${reverse}<>'"