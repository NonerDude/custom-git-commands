# custom-git-commands
A collection of useful git commands


Smart checkout by substring
git config --global alias.chf '!sh -c "BRANCH_PATTERN=$1; if [ -z \"\$BRANCH_PATTERN\" ]; then echo \"\${yellow}Please provide a branch sub-string\${no_color}\\n\"; exit; fi; git checkout \$BRANCH_PATTERN  2>/dev/null; if [ \$? -eq 0 ]; then exit; fi; yellow=\"\\033[0;33m\"; cyan=\"\\033[0;36m\"; no_color=\"\\033[0m\"; echo \"Could not checkout to given branch name,\n\${cyan}Searching a branch name with given string\${no_color}\n\"; MATCHING_BRANCHES=\$( git branch --format=\"%(refname:short)\" | grep -i \$BRANCH_PATTERN | xargs echo ); if [ -z \"\$MATCHING_BRANCHES\" ]; then echo \"Could not find a local branch name with given string,\n\${cyan}Searching a branch name with given string in \${yellow}remote branches\${no_color}\n\"; MATCHING_BRANCHES=\$( git branch --remote --format=\"%(refname:short)\" | sed \"s/origin\///g\" | grep -i \$BRANCH_PATTERN | xargs echo ); fi; if [ -z \"\$MATCHING_BRANCHES\" ]; then echo \"\${yellow}No matching branch found\${no_color}\\n\"; elif [ \"\$MATCHING_BRANCHES\" != \"\$(echo \$MATCHING_BRANCHES | sed \"s/ //g\")\" ]; then echo \"\${yellow}Multiple matching branches found\${no_color}:\"; echo \"\$(echo \$MATCHING_BRANCHES | sed \"s/ /\\n/g\")\\n\"; else git checkout \$MATCHING_BRANCHES; fi;"'

Last Checked-out Branches
git config --global alias.lbr '!f() { 
  remove_duplicates="cat";
  reverse="";
  count=5;  # Default to 5
  while getopts "run:" opt; do
    case $opt in
      r) reverse="reverse";;
      u) remove_duplicates="perl -ne '\''print unless \$seen{\$_}++'\''";;
      n) count=$OPTARG;;
    esac
  done
  shift $((OPTIND -1))
  git reflog | grep -E "checkout: moving from" | sed -E "s/.*checkout: moving from [^ ]+ to ([^ ]+).*/\\1/" | eval $remove_duplicates | eval "perl -e '\''@lines=<>; print @lines[0..($count-1)]'\''" | eval "perl -e '\''print ${reverse}<>'\''";
}; f'

Current Branch
git config --global --add alias.cu '!sh -c "cyan=\"\\033[0;36m\"; no_color=\"\\033[0m\"; echo \"\${cyan}$(git rev-parse --abbrev-ref HEAD)\${no_color}\";"'
