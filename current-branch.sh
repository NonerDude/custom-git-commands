#!/bin/bash

cyan="\033[0;36m"
no_color="\033[0m"

echo "${cyan}$(git rev-parse --abbrev-ref HEAD)${no_color}"
