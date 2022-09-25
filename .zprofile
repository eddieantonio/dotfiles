######################### Login shell configuration ##########################
# Things that should be loaded once every login shell is opened.
# On macOS with Terminal.app and iTerm2, this is effectively whenever a new
# tab is opened, though this is configurable.
##############################################################################

# Enable Homebrew <https://brew.sh/>
eval "$(/opt/homebrew/bin/brew shellenv)"

# Enable my personal commands
path+=( "$HOME/.local/bin" )

# Enable conda -- note, place BEFORE pyenv (because conda wants to be first,
# but I want pyenv to be first).
export CONDA_AUTO_ACTIVATE_BASE=False
command -v conda &>/dev/null && eval "$(conda shell.zsh hook)" || true

# Enable pyenv -- note, must come AFTER sourcing brew
command -v pyenv &>/dev/null && path=( "$(pyenv root)/shims" "${path[@]}" ) || true
