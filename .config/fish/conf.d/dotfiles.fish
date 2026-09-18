# Dotfiles management (bare git repo in ~/.dotfiles)
function dotfiles --wraps git
    /usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME $argv
end
