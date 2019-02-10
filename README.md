# Prototik's dotfiles
Collection of standalone configs for zsh for easy-to-use setup for new machines /etc

## One-click installation
Main method of installation involves moving (almost) all zsh related things to separate directory and cloning this repo to that directory:

```zsh
zsh <(curl -Ls https://tinyurl.com/kk-files)
```
If you don't trust tinyurl (and you do it right) or want to review that script - use `https://gitlab.com/Prototik/dotfiles/raw/master/install.zsh` instead.

You can specify ZDOTDIR location by `-z` argument (by default ~/.zsh).

## Manual installation
```
echo 'ZDOTDIR="$HOME/.zsh"` >> ~/.zshenv
source ~/.zshenv
git clone https://gitlab.com/Prototik/dotfiles.git "$ZDOTDIR"
```

## Configure keybinds
Generate zkbd mapping for you terminal:
```zsh
autoload zkbd && zkbd
# Follow the instruction for zkbd
```

You rocks! Just restart your terminal (or do `source "$ZDOTDIR/.zshrc"`) to see changes

## Updating
This template contains simple wrapper around `git` called `rc`. To update your dotfiles do `rc update`.

## Customizing
Add new files to `$ZDOTDIR/.zshrc.d` with zsh extension and... that's it. You need more? Why?
