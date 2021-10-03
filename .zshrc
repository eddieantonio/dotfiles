# Interactive shell configuration
#
# Run for any invocation of zsh with stdin being a tty.
# Put all your garbage aliases here!

# Manage dotfiles using the "StreakyCobra" method:
alias dotfiles='git --git-dir=/$HOME/.dotfiles/ --work-tree=$HOME'

# Import my aliases
if [ -f "$HOME/.aliases" ]; then
    source "$HOME/.aliases"
fi

# Load fzf -- fuzzy file searcher
# Makes ctrl+r awesome
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
