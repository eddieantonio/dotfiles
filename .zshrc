# Interactive shell configuration
#
# Run for any invocation of zsh with stdin being a tty.

# Setup zplug
# https://github.com/zplug/zplug
source $HOME/.zplug/init.zsh

# zplug plugins
# Have it manage itself:
zplug  'zplug/zplug', hook-build:'zplug --self-manage'

# Load fzf -- fuzzy file searcher
# Makes ctrl+r awesome
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Put all your garbage aliases here!

# Manage dotfiles using the "StreakyCobra" method:
alias dotfiles='git --git-dir=/$HOME/.dotfiles/ --work-tree=$HOME'

# Import my aliases
if [ -f "$HOME/.aliases" ]; then
    source "$HOME/.aliases"
fi

# Use z <https://github.com/rupa/z>
if [ -d "$HOME/.local/opt/z" ]; then
    source "$HOME/.local/opt/z/z.sh"
fi

# Prompt stuff!

# See: https://github.com/eddieantonio/prezto/blob/master/modules/prompt/functions/prompt_eddieantonio_setup
prompt_eddieantonio_lprompt() {
    local pchar="❯"

    local directory_colour=32
    local success_colour=74
    local error_color=124

    # ~
    print -n '%F{'$directory_colour'}%1~%f'

    # 127
    print -n '%(?.%F{'$success_colour'}'
    print -n '. %F{'$error_color'}%?)'

    print -n "$pchar"

    print -n '%f '
}

prompt_eddieantonio_rprompt() {
    print -n "%{%2v%}"
    print -n '%1v'
    print -n '%f%k'
}

prompt_eddieantonio_dynamic_rprompt() {
    print -n '%{'
    ~/Programming/git-status-color/git-status-color
    print -n '%}'
    print -n '%1v'
    print -n '%f%k'
}

prompt_eddieantonio_precmd() {
    if [ "`git rev-parse --is-inside-work-tree 2>/dev/null`" = "true" ]; then
        psvar=(
            "$(git rev-parse --abbrev-ref HEAD)"
        )
    else
        psvar=()
    fi

    RPROMPT="$(prompt_eddieantonio_dynamic_rprompt)"
}

prompt_eddieantonio_setup() {
    prompt_opts=(percent)
    zmodload zsh/zle

    add-zsh-hook precmd prompt_eddieantonio_precmd

    PROMPT="$(prompt_eddieantonio_lprompt)"
    RPROMPT="$(prompt_eddieantonio_rprompt)"
}

# TODO: this is a mess!
# Clean up the prompt stuff.
# Here are some useful links:
#  - https://unix.stackexchange.com/questions/454253/process-prompt-directives-inside-psvar-without-prompt-subst
#  - https://github.com/eddieantonio/prezto/blob/master/modules/prompt/functions/prompt_eddieantonio_setup
#  - https://zsh.sourceforge.io/Doc/Release/Prompt-Expansion.html
#  - https://github.com/eddieantonio/prezto/blob/master/modules/prompt/functions/git-info-psvar
#  - https://iterm2.com/documentation-touch-bar.html

# iTerm2 Shell integration
test -e "$HOME.iterm2_shell_integration.zsh" && source "$HOME/.iterm2_shell_integration.zsh" || true

prompt_eddieantonio_setup
