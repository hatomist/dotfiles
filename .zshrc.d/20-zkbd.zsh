#!/usr/bin/env zsh
[[ -e "${ZDOTDIR:-$HOME}/.zkbd/$TERM-$VENDOR-$OSTYPE" ]] && source "${ZDOTDIR:-$HOME}/.zkbd/$TERM-$VENDOR-$OSTYPE"

function _bind_zkbd_key() {
  local _key="${key[$1]}"
  [[ -n $_key ]] && bindkey "$_key" $2
}

_bind_zkbd_key "${key[Left]}"   backward-char
_bind_zkbd_key "${key[Right]}"  forward-char
_bind_zkbd_key "${key[Home]}"  beginning-of-line
_bind_zkbd_key "${key[End]}"    end-of-line
_bind_zkbd_key "${key[Delete]}" delete-char

unfunction _bind_zkbd_key

