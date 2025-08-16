#!/usr/bin/env bash
set -euo pipefail

# Remove installed files and plugins created by scripts/setup.sh

VIMRC="$HOME/.vimrc"
NVIM_INIT="$HOME/.config/nvim/init.vim"
VIM_PLUG="$HOME/.vim/autoload/plug.vim"
VIM_PLUGGED="$HOME/.vim/plugged"
NVIM_PLUGGED="$HOME/.local/share/nvim/plugged"

confirm() {
  read -rp "This will remove ~/.vimrc and plugin directories. Continue? [y/N] " ans
  [[ "${ans:-N}" =~ ^[Yy]$ ]]
}

main() {
  confirm || { echo "Aborted."; exit 1; }

  rm -f "$VIMRC" || true
  rm -f "$NVIM_INIT" || true
  rm -f "$VIM_PLUG" || true
  rm -rf "$VIM_PLUGGED" || true
  rm -rf "$NVIM_PLUGGED" || true

  echo "Removed Vim/Neovim config and plugin directories."
}

main "$@"
