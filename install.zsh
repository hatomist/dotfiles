#!/usr/bin/env zsh

[[ -e "$HOME/.zshenv" ]] && source "$HOME/.zshenv"
ZDOTDIR="${ZDOTDIR:-$HOME}"

function _install_symlink() {
    ln -sirv "$1" "$2"
}

_install_method=_install_symlink

function _install_dotfiles() {
  local REPO="https://gitlab.com/Prototik/dotfiles.git"
  local TARGET_DIR=${ZDOTDIR:P}
  local DOTFILES_DIR
  case "$0" in
    /*) DOTFILES_DIR="${0:P:h}"      ;;
    *)  DOTFILES_DIR="$PWD/${0:P:h}" ;;
  esac
  local REPO="https://gitlab.com/Prototik/dotfiles.git"

  if [[ "$TARGET_DIR" == "$DOTFILES_DIR" ]]; then
    echo " # Dotfiles installed into ZDOTDIR, no any actions neccessary"
  elif [[ ! -e "$DOTFILES_DIR/.zshrc" ]]; then
    echo " # Headless installer detected, cloning full dotfiles..."
    TARGET_DIR="$HOME/.zsh"
    git clone "$REPO" "$TARGET_DIR"
    source "$TARGET_DIR/install.zsh"
  else
    echo " # Installing dotfiles, you may asked for overwrite files"

    "$_install_method" "$DOTFILES_DIR/.zshrc" "$TARGET_DIR/.zshrc"
    "$_install_method" "$DOTFILES_DIR/.zshrc.d" "$TARGET_DIR/.zshrc.d"
    "$_install_method" "$DOTFILES_DIR/.profile" "$HOME/.profile"

    echo " # Installation completed"
    if [[ -o interactive ]]; then
      echo " # Loading new rc right now..."
      source "$HOME/.profile"
      source "$ZDOTDIR/.zshrc"
    fi
  fi
}

_install_dotfiles

unfunction _install_dotfiles
unfunction _install_symlink
unset _install_method
