#Bricktech2000/Clean-Bash-Prompt
export CLEAN_PROMPT_CHECK_PROC="node"
export PS1='`status=$?; running=$({ pgrep -x $CLEAN_PROMPT_CHECK_PROC; } | wc -l); if [[ $UID -eq 0 ]]; then printf "\[\033[38;5;044m\]\`whoami\`\U0001F48E"; else printf "\[\033[38;5;008m\]\`whoami\`\U0001F517"; fi; printf "\[\033[00m\]"; if [[ $status -gt 0 ]]; then printf "\[\033[91m\]"; else printf "\[\033[94m\]"; fi; printf "\`pwd | rev | cut -d '/' -f 2 | rev\`/\`pwd | rev | cut -d '/' -f 1 | rev\`\[\033[00m\]"; git branch --show-current &> /dev/null; if [[ $? -eq 0 ]]; then status=$(git status 2> /dev/null); if [[ $status =~ Changes\ not\ staged\ for\ commit: ]] || [[ $status =~ Untracked\ files: ]]; then printf "\[\033[33m\]"; elif [[ $status =~ Changes\ to\ be\ committed: ]]; then printf "\[\033[32m\]"; else printf "\[\033[94m\]"; fi; printf " ($(git branch --show-current))"; elif [[ running -gt 0 ]]; then printf " \[\033[94m\][live]\[\033[00m\]"; fi; if [[ running -eq 0 ]]; then printf " \[\033[91m\][down]\[\033[00m\]"; fi; printf "\[\033[00m\] "`' && export PS2=' ' && export LS_COLORS='ow=01;34;40'
