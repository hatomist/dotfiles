alias zshrc='${=EDITOR} ${ZDOTDIR:-$HOME}/.zshrc'
alias zplugrc='${=EDITOR} ${ZDOTDIR:-$HOME}/.zplugrc'
alias yolo='git commit -m "$(curl -s whatthecommit.com/index.txt)"'

[[ "$ZDOTDIR" == "$HOME" ]] || function rc {
  case "$1" in
    yolo)
      git -C "$ZDOTDIR" add "$ZDOTDIR"
      git -C "$ZDOTDIR" commit -m "$(curl -s whatthecommit.com/index.txt)" "${@:2}"
      git -C "$ZDOTDIR" push
      ;;
    *)
      git -C "$ZDOTDIR" "${@:1}"
      ;;
  esac
}
