###################### Interactive shell configuration #######################
# Run for any interactive usage of zsh                                       #
#                                                                            #
# See $ZSHHOME                                                               #
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

# Scroll with trackpad in less:
export LESS=-R

export EDITOR=vim
export VISUAL=vim
# Zsh "helpfully" sets vi mode if the EDITOR is vim. But I have muscle memory
# for emacs keybinings so:
# See: https://unix.stackexchange.com/a/197841
bindkey -e

# For demos, this is enough configuration to ensure a "default-ish" environment.
if [ "$DEMO_ENVIRONMENT" -eq 1 ] ; then
    autoload -Uz promptinit && promptinit
    # for that authentic git bash experience:
    #prompt gitbash MINGW64
    prompt restore
    alias gcc=gcc-13
    source $HOME/.zprofile
    export GIT_CONFIG_GLOBAL=/tmp/gitconfig
    return
fi


source "$ZSHCONFIGDIR/init.zsh"

# Configure what zle consisders a "word".
#
# Affects Ctrl+W, Esc+F, Esc+B, etc.
# (a.k.a., backward-kill-word, forward-word, backward-word)
#
# I want Ctrl+W to delete path segments rather delete an entire path.
#
# See https://zsh.sourceforge.io/Doc/Release/User-Contributions.html#ZLE-Functions
autoload -U select-word-style
select-word-style bash

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

# Completion
#
# See:
#  - https://zsh.sourceforge.io/Doc/Release/Completion-System.html
#  - https://thevaluable.dev/zsh-completion-guide-examples/
#  - man zshcompsys
#
# The following lines were added by compinstall
zstyle ':completion:*' completer _complete _ignored _correct _approximate
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{[:lower:]}={[:upper:]}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
zstyle ':completion:*' max-errors 2
zstyle :compinstall filename '/Users/eddie/.zshrc'
autoload -Uz compinit
compinit
# End of lines added by compinstall

# My aliases. Load this AFTER compinit because some aliases
# invoke `compdef`
source "$HOME/.aliases"

# NO CLOBBER IS NECESSARY!
set -o noclobber

# TODO: look at this: http://micahelliott.com/posts/2016-01-16-how-to-structure-zshrc.html
# TODO: import some of these: https://github.com/eddieantonio/dotfiles-general/blob/master/home/.aliases
# TODO: read this: https://grml.org/zsh/zsh-lovers.html
fpath=(~/Programming/gitbash-zsh-theme/functions $fpath)
