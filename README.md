# Prototik's dotfiles
Collection of standalone configs for zsh for easy-to-use setup for new machines /etc

## Installation
Main method of installation involves moving (almost) all zsh related things to separate directory and cloning this repo to that directory:

```zsh
echo 'ZDOTDIR="$HOME/.zsh"` >> ~/.zshenv
source ~/.zshenv
git clone https://gitlab.com/Prototik/dotfiles.git "$ZDOTDIR"
```

_Optional (but **highly recommend**) step_
Generate zkbd mapping for you terminal:
```zsh
autoload zkbd && zkbd
# Follow the instruction for zkbd
```

You rocks! Just restart your terminal (or do `source "$ZDOTDIR/.zshrc"`) to see changes

## Updating
This template contains simple wrapper around `git` called `rc`. To update your dotfiles do `rc pull`.

## Customizing
Add new files to `$ZDOTDIR/.zshrc.d` with zsh extension and... that's it. You need more? Why?
