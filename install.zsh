#!/usr/bin/env zsh

opts=(
  --zdotdir '.zsh'
  --repo 'https://gitlab.com/Prototik/dotfiles.git'
)

zparseopts -A opts -K -- -zdotdir: -repo:

TARGET=$(realpath --relative-base="$HOME" "${opts[--zdotdir]}")

case "$TARGET" in
  /)
    echo " ### Installing outside of home directory"
    ABSOLUTE_TARGET="$TARGET"
    ENV_TARGET="$TARGET"
    ;;
  *)
    ABSOLUTE_TARGET=$(realpath "$TARGET")
    ENV_TARGET="\$HOME/$TARGET"
    ;;
esac

echo " # Installing dotfiles to $ABSOULTE_TARGET"

[[ -d "$ABSOULTE_TARGET ]] && {
  echo "Target directory already exists! Either remove the old one or specify another dir with --zdotdir option" >&2
  exit 1
}

git clone "${opts[--repo]}" "$ABSOULTE_TARGET"

touch "$HOME/.zshenv"
sed -i "$HOME/.zshenv" -e '/^ZDOTENV=/d' -e "1s/^/ZDOTENV=$ENV_TARGET\n/"

echo "Done! Open a new terminal to see changes."
