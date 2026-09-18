# Dotfiles management (bare git repo in ~/.dotfiles)
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

# Starship prompt
eval "$(starship init bash)"
