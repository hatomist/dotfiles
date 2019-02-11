alias zshrc='${=EDITOR} ${ZDOTDIR:-$HOME}/.zshrc'
alias zplugrc='${=EDITOR} ${ZDOTDIR:-$HOME}/.zplugrc'
alias yolo='git commit -m "$(curl -s whatthecommit.com/index.txt)"'

[[ "${ZDOTDIR:-$HOME}" != "$HOME" ]] && function rc {
  case "$1" in
    cd)
      cd "$ZDOTDIR/${@:2}"
      ;;
    update)
      git -C "$ZDOTDIR" pull && \
      zplug update && \
      source "$ZDOTDIR/.zshrc"
      ;;
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
