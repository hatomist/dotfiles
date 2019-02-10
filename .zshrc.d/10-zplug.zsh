#!/usr/bin/env zsh
ZPLUG_HOME="${ZDOTDIR:-$HOME}/.zplug"

[[ -d "$ZPLUG_HOME" ]] || git clone --quiet https://github.com/zplug/zplug.git "$ZPLUG_HOME"

source "$ZPLUG_HOME/init.zsh"
source "${ZDOTDIR:-$HOME}/.zplugrc"

if ! zplug check; then
    zplug install
fi

zplug load
