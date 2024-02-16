######################### Login shell configuration ##########################
# Things that should be loaded once every login shell is opened.             #
# On macOS with Terminal.app and iTerm2, this is effectively whenever a new  #
# tab is opened, though this is configurable.                                #
##############################################################################

# Enable Homebrew <https://brew.sh/>
eval "$(/opt/homebrew/bin/brew shellenv)"

# Enable my personal commands
path+=( "$HOME/.local/bin" )

# Lazy-load conda
# (note: there might be a conflict with pyenv... once both are loaded.... maybe)
export CONDA_AUTO_ACTIVATE_BASE=False
command -v conda &>/dev/null && source "$HOME/.zshconfig/lazy_load_conda.zsh" || true

# Enable pyenv -- note, must come AFTER sourcing brew
command -v pyenv &>/dev/null && path=( "$(pyenv root)/shims" "${path[@]}" ) || true

# Enable frum -- note, must come AFTER source brew
# Ruby version manager. **NOT** RVM!
command -v frum &>/dev/null && eval "$(frum init)" || true
