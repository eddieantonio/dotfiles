###################### Interactive shell configuration #######################
# Run for any interactive usage of zsh
##############################################################################

# Manage my dotfiles using the "StreakyCobra" method:
# See README.md for details
alias dotfiles='git --git-dir=/$HOME/.dotfiles/ --work-tree=$HOME'


################################## Goodies ###################################

# Load goodies for interactive use (only if they're installed)

# fzf -- fuzzy file searcher (makes ctrl+r awesome)
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh || true

# z -- jump to directories by “frecency” <https://github.com/rupa/z>
# TODO: use z.lua instead?
[ -d "$HOME/.local/opt/z" ] && source "$HOME/.local/opt/z/z.sh" || true

# iTerm2 Shell integration
[ -e "$HOME/.iterm2_shell_integration.zsh" ] && source "$HOME/.iterm2_shell_integration.zsh" || true


######################### My personal configuration ##########################

# Load my configuration
ZSHCONFIGDIR="$HOME/.zshconfig"
fpath+=( "$ZSHCONFIGDIR/functions" )
fpath+=( "$HOME/.zfunc" )

source "$ZSHCONFIGDIR/init.zsh"
source "$HOME/.aliases"

# Scroll with trackpad in less:
export LESS=-r

export EDITOR=vim
export VISUAL=vim
# Zsh "helpfully" sets vi mode if the EDITOR is vim. But I have muscle memory
# for emacs keybinings so:
# See: https://unix.stackexchange.com/a/197841
bindkey -e

# Select my preferred prompt using the zsh-users prompt system
autoload -Uz promptinit && promptinit
# Other neat options:
#  - rc -- clever minimalistic prompt; good for copy-pasting
#  - default - zsh default
#  - restore - macOS default
prompt eddieantonio

# Correct typos when I write a command.
setopt CORRECT

# History
# Cross-reference with /private/etc/zshrc
HISTFILE=${ZDOTDIR:-$HOME}/.zsh_history
HISTSIZE=20000
SAVEHIST=10000
setopt SHARE_HISTORY

# Completion -- see: https://zsh.sourceforge.io/Doc/Release/Completion-System.html
# The following lines were added by compinstall
zstyle ':completion:*' completer _complete _ignored _correct _approximate
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{[:lower:]}={[:upper:]}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
zstyle ':completion:*' max-errors 2
zstyle :compinstall filename '/Users/eddie/.zshrc'
# End of lines added by compinstall
autoload -Uz compinit
compinit
