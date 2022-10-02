# get the name of the branch we are on
git_prompt_info() {
  local ref
  [[ -f .git/HEAD ]] && ref=$(<.git/HEAD) && ref=${ref#ref: } ||
  ref=$(command git symbolic-ref HEAD 2> /dev/null) ||
  ref=$(command git rev-parse --short HEAD 2> /dev/null) || return 0
  echo "%{$fg_no_bold[blue]%}(${ref#refs/heads/}$(parse_git_dirty)%{$reset_color%}"
}

# Checks if working tree is dirty
parse_git_dirty() {
  # [[ "$DISABLE_UNTRACKED_FILES_DIRTY" == "true" ]]
  # GIT_STATUS=$(command git status -s --ignore-submodules=dirty -uno 2> /dev/null)
  local GIT_STATUS=$(command git status -s --ignore-submodules=dirty 2> /dev/null)
  if [[ -n $GIT_STATUS ]]; then
    echo ")%{$fg[yellow]%}✗%{$reset_color%}"
  else
    echo ')'
  fi
}

PROMPT='%{$bg[grey]%}%{$fg[cyan]%}%3~%{$reset_color%}!%{$fg_bold[grey]%}%h%(?.%{$fg_no_bold[green]%}.%{$fg[red]%}?%?%{$fg_no_bold[red]%})\$$(git_prompt_info)%{$reset_color%} '

if (( $SHLVL > 2 )); then
  PROMPT='%{$fg[yellow]%}[$SHLVL]'"$PROMPT"
fi

# RPROMPT='%{$fg[red]%}%6~%{$reset_color%}'
