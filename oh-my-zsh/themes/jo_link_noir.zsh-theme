#kate: hl bash

# PROMPT='%{$fg_bold[green]%}%p %{$fg[cyan]%}%c %{$fg_bold[blue]%}$(git_prompt_info)%{$fg_bold[blue]%} % %{$reset_color%}'
# PROMPT='%{$fg_bold[cyan]%}%c%{$fg_bold[blue]%}$(git_prompt_info)%{$fg_bold[green]%}!%{$fg[grey]%}%h%{$reset_color%}%{$fg[magenta]%}$%{$reset_color%}'

PROMPT='%{$bg[black]%}%{$fg_bold[cyan]%}%3~%{$reset_color%}!%{$fg_bold[grey]%}%h%(?.%{$fg[green]%}.%{$fg_no_bold[red]%}?%?%{$fg_bold[red]%})$%{$reset_color%} '
if [ $SHLVL -gt 1 ]; then
  PROMPT='%{$fg[yellow]%}[$SHLVL]'"$PROMPT"
fi
if [ "$USER" = root ]; then
  PROMPT='%{$fg_bold[red]%}root%{$fg_no_bold[green]%}@%{$fg[yellow]%}%m%{$fg_bold[magenta]%}:'"$PROMPT"
fi

# RPROMPT='%{$fg[red]%}%6~$(git_prompt_info)$(svn_prompt_info)%{$reset_color%}'
RPROMPT='%{$fg[red]%}%6~%{$reset_color%}'
PS2='%{$fg[green]%}>%{$reset_color%}'

# ZSH_THEME_GIT_PROMPT_PREFIX=" %{$fg_bold[blue]%}git:(%{$fg[red]%}"
# ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
# ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%})"
# ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%})"
#
# ZSH_THEME_SVN_PROMPT_PREFIX=" %{$fg_bold[blue]%}svn:(%{$fg[red]%}"
# ZSH_THEME_SVN_PROMPT_SUFFIX="%{$reset_color%}"
# ZSH_THEME_SVN_PROMPT_DIRTY="%{$fg[blue]%})"
# ZSH_THEME_SVN_PROMPT_CLEAN="%{$fg[blue]%})"
