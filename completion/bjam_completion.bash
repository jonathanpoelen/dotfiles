_bjam_completion () {
  local cur prev words cword
  _init_completion || return
  COMPREPLY=($(compgen -W '$(bjam -an --debug-building | \
    sed -nE "/^ *Building t/{s#^ *Building target '\''\./([^'\'']+)'\''#\1#p}" | \
    sort -u)' -- "$cur" ))
}

complete -F _bjam_completion bjam
