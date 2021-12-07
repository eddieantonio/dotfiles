# Dotfiles

Using the [StreakyCobra] method of dotfile management.

## Install on a new machine

```bash
git clone --separate-git-dir=$HOME/.dotfiles git@github.com:eddieantonio/dotfiles.git /tmp/temporary-clone
rm -r /tmp/temporary-clone
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
dotfiles config status.showUntrackedFiles no
dotfiles restore .
```

## Usage

Use the `dotfile` alias as you would use `git`, but exclusively to
interact with this repository.

## Caveats

Git will not notify you you about untracked files. **You are responsible for
`git add`ing every file you want to track!**

There are things you probably **do not** want to track. For this,
I provided a `.gitignore` file.

## About

I'm trying out a different way of managing dotfiles. I call it the
"StreakyCobra" method, after [this HN post][StreakyCobra]. There are other
writeups [[1]][atlassian] [[2]][antelo] about this as well.

[StreakyCobra]: https://news.ycombinator.com/item?id=11070797
[atlassian]: https://www.atlassian.com/git/tutorials/dotfiles
[antelo]: https://antelo.medium.com/how-to-manage-your-dotfiles-with-git-f7aeed8adf8b
