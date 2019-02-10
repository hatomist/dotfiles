#!/usr/bin/env zsh

zdotdir='.zsh'
repo='https://gitlab.com/Prototik/dotfiles.git'

while getopts ':z:r:' arg; do
  case "$arg" in
    z)
      zdotdir="$OPTARG"
      ;;
    r)
      repo="$OPTARG"
      ;;
    *)
      echo "Usage: zsh install [-z dir] [-r repo]"
      ;;
  esac
done

TARGET=$(realpath -m --relative-base="$HOME" "$zdotdir")

case "$TARGET" in
  /*)
    echo " ### Installing outside of home directory"
    ABSOLUTE_TARGET="$TARGET"
    ENV_TARGET="$TARGET"
    ;;
  *)
    ABSOLUTE_TARGET=$(realpath -m "$HOME/$TARGET")
    ENV_TARGET="\$HOME/$TARGET"
    ;;
esac

echo " # Installing dotfiles to $ABSOLUTE_TARGET"

[[ -d "$ABSOLUTE_TARGET" ]] && {
  echo "Target directory already exists! Either remove the old one or specify another dir with -z option" >&2
  exit 1
}

mkdir -p $(dirname "$ABSOLUTE_TARGET")

git clone "$repo" "$ABSOLUTE_TARGET"

touch "$HOME/.zshenv"
sed -i "$HOME/.zshenv" -e "1iZDOTDIR=$ENV_TARGET" -e '/^ZDOTDIR=/d'

echo "Done! Open a new terminal to see changes."

