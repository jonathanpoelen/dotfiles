_bjam_completion () {
  reply=($(sed -n -E '/^unit-test|^exe|^install|^alias|^lib|^explicit/s/^[-a-z]+\s+([-_a-zA-Z0-9]+).*/\1/p' Jamroot)) 
}

compctl -K _bjam_completion bjam
