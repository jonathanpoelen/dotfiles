_bjam_completion () { 
  reply=($(grep -E '^unit-test|^exe|^install|^alias' Jamroot 2>/dev/null | sed -E s'/^[-a-z]+\s+([-_a-zA-Z0-9]+).*/\1/')) 
}

compctl -K _bjam_completion bjam
