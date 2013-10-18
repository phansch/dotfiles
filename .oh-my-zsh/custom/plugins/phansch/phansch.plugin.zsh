# Modified version of https://github.com/ryanb/dotfiles/blob/master/oh-my-zsh/custom/plugins/rbates/rbates.plugin.zsh
c() { cd ~/code/$1; }
_c() { _files -W ~/code -/; }
compdef _c c

h() { cd ~/$1; }
_h() { _files -W ~/ -/; }
compdef _h h
