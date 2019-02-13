#!/usr/bin/env zsh
[[ -e "${ZDOTDIR:-$HOME}/.zkbd/$TERM" ]] && source "${ZDOTDIR:-$HOME}/.zkbd/$TERM"
[[ -e "${ZDOTDIR:-$HOME}/.zkbd/$TERM-$VENDOR" ]] && source "${ZDOTDIR:-$HOME}/.zkbd/$TERM-$VENDOR"
[[ -e "${ZDOTDIR:-$HOME}/.zkbd/$TERM-$VENDOR-$OSTYPE" ]] && source "${ZDOTDIR:-$HOME}/.zkbd/$TERM-$VENDOR-$OSTYPE"
[[ -e "${ZDOTDIR:-$HOME}/.zkbd/$TERM-${${DISPLAY:t}:-$VENDOR-$OSTYPE}" ]] && source "${ZDOTDIR:-$HOME}/.zkbd/$TERM-${${DISPLAY:t}:-$VENDOR-$OSTYPE}"

_zkbd_missing=false

function _bind_zkbd_key() {
  [[ -n ${key[$1]} ]] && bindkey "${key[$1]}" $2 || _zkbd_missing=true
}

_bind_zkbd_key Left   backward-char
_bind_zkbd_key Right  forward-char
_bind_zkbd_key Up     up-line-or-history
_bind_zkbd_key Down   down-line-or-history
_bind_zkbd_key Home   beginning-of-line
_bind_zkbd_key End    end-of-line
_bind_zkbd_key Delete delete-char

unfunction _bind_zkbd_key

[[ "$_zkbd_missing" == "true" ]] && echo " ### Please generate zkbd mapping with 'autoload zkbd && zkbd' ###"

unset _zkbd_missing
