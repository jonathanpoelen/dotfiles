_bjam_completion () {
  reply=($(
    bjam -an --debug-building | \
      sed -nE "/^ *Building t/{s#^ *Building target '\./([^']+)'#\1#p}" | \
      sort -u
  ))
}

compctl -K _bjam_completion -M 'r:|[_[:lower:]]=** r:|=*' bjam
