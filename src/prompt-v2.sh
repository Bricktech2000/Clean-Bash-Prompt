#Bricktech2000/Clean-Bash-Prompt
export CLEAN_PROMPT_CHECK_PROC="python3"
export PS1='`
  status=$?;

  printf "        \[\033[38;5;008m\]\`dirs\`\r";

  if [[ $UID -eq 0 ]];
    then printf "\[\033[1m\033[38;5;015m\]🗲 \[\033[0m\]";
    else printf "\[\033[1m\033[38;5;008m\]\[\033[0m\]";
  fi;

  # dirs_path="\`dirs\`";
  # IFS="/" read -r -a array <<< "$dirs_path";
  # for directory in "${array[@]}"; do
  #   letter="\`echo "$directory" | head -c 1\`"
  #   printf "\[\033[1m\033[38;5;007m\]$letter\[\033[0m\]";
  # done;

  # letter1="\`pwd | rev | cut -d '/' -f 1 | rev | cut -c1\`";
  # letter2="\`pwd | rev | cut -d '/' -f 1 | rev | cut -c2\`";
  # if [[ $letter1 != "." ]];
  #   then printf "\[\033[1m\033[38;5;007m\]$letter1\[\033[0m\]";
  #   else printf "\[\033[1m\033[38;5;008m\]$letter2\[\033[0m\]";
  # fi;

  # letter="\`pwd | rev | cut -d '/' -f 1 | rev | cut -c1\`";
  if [[ $status -gt 0 ]];
    then printf "\[\033[1m\033[91m\]×";
    else printf "\[\033[1m\033[38;5;015m\]✓";
  fi;
  printf "\[\033[0m\]";


  file_count="\`ls -p | grep -v / | wc -l\`";
  folder_count="\`ls -p | grep -e / | wc -l\`";
  ls -ld .!(|.) &> /dev/null
  if [[ $? -eq 0 ]];
    then printf "\[\033[1m\033[38;5;015m\]"; 
    else printf "\[\033[1m\033[38;5;007m\]";
  fi;
  if (( file_count <= 0 )); then
    if (( folder_count <= 0 ));                      then printf "⠀"; fi;
    if (( folder_count > 0 && $folder_count <= 1 )); then printf "⢀"; fi;
    if (( folder_count > 1 && $folder_count <= 4 )); then printf "⢠"; fi;
    if (( folder_count > 4 && $folder_count <= 8 )); then printf "⢰"; fi;
    if (( folder_count > 8 ));                       then printf "⢸"; fi;
  fi;
  if (( file_count > 0 && file_count <= 1)); then
    if (( folder_count <= 0 ));                      then printf "⡀"; fi;
    if (( folder_count > 0 && $folder_count <= 1 )); then printf "⣀"; fi;
    if (( folder_count > 1 && $folder_count <= 4 )); then printf "⣠"; fi;
    if (( folder_count > 4 && $folder_count <= 8 )); then printf "⣰"; fi;
    if (( folder_count > 8 ));                       then printf "⣸"; fi;
  fi;
  if (( file_count > 1 && file_count <= 4)); then
    if (( folder_count <= 0 ));                      then printf "⡄"; fi;
    if (( folder_count > 0 && $folder_count <= 1 )); then printf "⣄"; fi;
    if (( folder_count > 1 && $folder_count <= 4 )); then printf "⣤"; fi;
    if (( folder_count > 4 && $folder_count <= 8 )); then printf "⣴"; fi;
    if (( folder_count > 8 ));                       then printf "⣼"; fi;
  fi;
  if (( file_count > 4 && file_count <= 8)); then
    if (( folder_count <= 0 ));                      then printf "⡆"; fi;
    if (( folder_count > 0 && $folder_count <= 1 )); then printf "⣆"; fi;
    if (( folder_count > 1 && $folder_count <= 4 )); then printf "⣦"; fi;
    if (( folder_count > 4 && $folder_count <= 8 )); then printf "⣶"; fi;
    if (( folder_count > 8 ));                       then printf "⣾"; fi;
  fi;
  if (( file_count > 8)); then
    if (( folder_count <= 0 ));                      then printf "⡇"; fi;
    if (( folder_count > 0 && $folder_count <= 1 )); then printf "⣇"; fi;
    if (( folder_count > 1 && $folder_count <= 4 )); then printf "⣧"; fi;
    if (( folder_count > 4 && $folder_count <= 8 )); then printf "⣷"; fi;
    if (( folder_count > 8 ));                       then printf "⣿"; fi;
  fi;
  printf "\[\033[0m\]";

  running_jobs="\`jobs -l | wc -l;\`"
  if [[ $running_jobs -gt 1 ]];
    then printf "\[\033[38;5;012m\]•\[\033[0m\]";
  fi;
  process_running=$({ pgrep -x $CLEAN_PROMPT_CHECK_PROC; } | wc -l);
  if [[ $process_running -eq 0 ]];
    then printf "\[\033[1m\033[91m\]×\[\033[0m\]";
  fi;

  git branch --show-current &> /dev/null;
  if [[ $? -eq 0 ]];
    then status=$(git status 2> /dev/null);
    if [[ $status =~ Changes\ not\ staged\ for\ commit: ]] || [[ $status =~ Untracked\ files: ]];
      then printf "\[\033[38;5;226m\]🡲 \[\033[0m\]";
    elif [[ $status =~ Changes\ to\ be\ committed: ]];
      then printf "\[\033[38;5;040m\]🡲 \[\033[0m\]";
    else
      printf "\[\033[94m\]🡲 \[\033[0m\]";
    fi;
  else printf " ";
  fi;
`'
export PS2=' '
