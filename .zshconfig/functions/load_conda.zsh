# Lazy-load conda
# Idea from https://www.reddit.com/r/zsh/comments/qmd25q/lazy_loading_conda/
# Thanks to u/AaronnBrock!
# (but drastically simplified 😅)

load_conda() {
    # Uninstall the alias that got us here:
    unalias conda

    # Run initialization as normal:
    eval "$(conda shell.zsh hook)"
}

# Install `conda` as an alias that loads everything properly:
alias conda="load_conda && conda"
