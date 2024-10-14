#!/bin/bash

BRANCH_PATTERN=$1

yellow="\033[0;33m"
cyan="\033[0;36m"
no_color="\033[0m"

if [ -z "$BRANCH_PATTERN" ]; then
  echo "${yellow}Please provide a branch sub-string${no_color}\n"
  exit
fi

git checkout "$BRANCH_PATTERN" 2>/dev/null
if [ $? -eq 0 ]; then
  exit
fi

echo "Could not checkout to given branch name,\n${cyan}Searching a branch name with given string${no_color}\n"
MATCHING_BRANCHES=$(git branch --format="%(refname:short)" | grep -i "$BRANCH_PATTERN" | xargs echo)

if [ -z "$MATCHING_BRANCHES" ]; then
  echo "Could not find a local branch name with given string,\n${cyan}Searching a branch name with given string in ${yellow}remote branches${no_color}\n"
  MATCHING_BRANCHES=$(git branch --remote --format="%(refname:short)" | sed "s/origin\///g" | grep -i "$BRANCH_PATTERN" | xargs echo)
fi

if [ -z "$MATCHING_BRANCHES" ]; then
  echo "${yellow}No matching branch found${no_color}\n"
elif [ "$MATCHING_BRANCHES" != "$(echo "$MATCHING_BRANCHES" | sed "s/ //g")" ]; then
  echo "${yellow}Multiple matching branches found${no_color}:"
  echo "$(echo "$MATCHING_BRANCHES" | sed "s/ /\n/g")\n"
else
  git checkout "$MATCHING_BRANCHES"
fi
