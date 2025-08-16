#!/usr/bin/env bash
set -euo pipefail

# Create symlinks instead of copying. Existing files are backed up.

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
backup() {
  local target="$1"
  if [[ -e "$target" && ! -L "$target" ]]; then
    mv "$target" "${target}.bak.$(date +%s)"
  fi
}

ln_safe() {
  local src="$1" dst="$2"
  backup "$dst"
  ln -snf "$src" "$dst"
}

main() {
  echo "Linking .vimrc -> ~/.vimrc"
  ln_safe "$ROOT_DIR/.vimrc" "$HOME/.vimrc"

  if command -v nvim >/dev/null 2>&1; then
    mkdir -p "$HOME/.config/nvim"
    echo "Linking .vimrc -> ~/.config/nvim/init.vim"
    ln_safe "$ROOT_DIR/.vimrc" "$HOME/.config/nvim/init.vim"
  fi

  echo "Done."
}

main "$@"
