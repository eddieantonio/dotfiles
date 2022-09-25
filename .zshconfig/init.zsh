############################# ZLE customization ##############################

# Press ctrl+z at an empty prompt to bring the background process to the foreground.
#
# I do this to enable a horribly janky workflow with vim. I'm editing in vim,
# and then I want to execute a quick shell command. I press ctrl+z to
# background it, run a command (the ⚙ symbol is visible in my prompt), then I
# press ctrl+z to get back to vim. Usually, this is a git command because my
# brain refuses how to learn vim-fugative ¯\_(ツ)_/¯
#
# Adapted from here: https://superuser.com/a/378045/711047
fancy-ctrl-z () {
  if [[ $#BUFFER -eq 0 ]]; then
    fg
    zle redisplay
  else
    # "suspends" the current line so that I can type a command before.
    zle push-input
  fi
}
zle -N fancy-ctrl-z
bindkey '^Z' fancy-ctrl-z

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
