###################### Interactive shell configuration #######################
# Run for any interactive usage of zsh
##############################################################################

# Manage my dotfiles using the "StreakyCobra" method:
# See README.md for details
alias dotfiles='git --git-dir=/$HOME/.dotfiles/ --work-tree=$HOME'


################################## Goodies ###################################

# Load goodies (only if they're installed)

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
# Zsh "helpfully" set vi mode if the EDITOR is vim. But I have muscle memory
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

# Completion -- see: https://zsh.sourceforge.io/Doc/Release/Completion-System.html
# The following lines were added by compinstall
zstyle ':completion:*' completer _complete _ignored _correct _approximate
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{[:lower:]}={[:upper:]}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
zstyle ':completion:*' max-errors 2
zstyle :compinstall filename '/Users/eddie/.zshrc'

# History
# Cross-reference with /private/etc/zshrc
HISTFILE=${ZDOTDIR:-$HOME}/.zsh_history
HISTSIZE=20000
SAVEHIST=10000
setopt INC_APPEND_HISTORY
setopt SHARE_HISTORY

autoload -Uz compinit
compinit
# End of lines added by compinstall


############################# Unorganized lines ##############################

# From: https://twitter.com/dailyzshtip/status/1480535189210157063
# powerful widgets #1
# save a command to history without executing it
# for your .zshrc
commit-to-history() {
      print -s ${(z)BUFFER}
      zle send-break
}
zle -N commit-to-history
bindkey "^h" commit-to-history # ctrl-h


# My dotfiles are a mess rn 🙃

# Adapted from https://twitter.com/thingskatedid/status/1483847024894099458
idot() {
      dot -Tpng \
          -Gdpi=125 \
          -Efontsize=18 \
          -Efontname=sans \
          -Nfontname=sans \
          -Gbgcolor=black \
          -Gcolor=white \
          -Ecolor=white \
          -Efontcolor=white \
          -Ncolor=white \
          -Nfontcolor=white \
      | convert -trim -bordercolor black -border 20 -transparent black - - \
      | imgcat
}

# Clean it up!
# https://zsh.sourceforge.io/Doc/Release/Functions.html#Hook-Functions

# TODO: clean this
# Ruby:
[ -f /opt/homebrew/bin/frum ] && eval "$(frum init)" || true

zprof
