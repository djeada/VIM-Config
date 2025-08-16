#!/usr/bin/env bash
set -euo pipefail

# Helper to install this Vim/Neovim configuration and plugins
# - Copies .vimrc to ~/.vimrc and ~/.config/nvim/init.vim (if Neovim)
# - Bootstraps vim-plug
# - Installs plugins (headless when possible)
# - Builds fzf binary if present

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
VIM_DIR="$HOME/.vim"
NVIM_CONFIG_DIR="$HOME/.config/nvim"
AUTOLOAD_DIR="$VIM_DIR/autoload"
PLUG_VIM="$AUTOLOAD_DIR/plug.vim"

copy_vimrc() {
  echo "[1/4] Copying .vimrc"
  cp "$ROOT_DIR/.vimrc" "$HOME/.vimrc"
  if command -v nvim >/dev/null 2>&1; then
    mkdir -p "$NVIM_CONFIG_DIR"
    cp "$ROOT_DIR/.vimrc" "$NVIM_CONFIG_DIR/init.vim"
    echo "      Copied for Neovim: $NVIM_CONFIG_DIR/init.vim"
  fi
}

install_vim_plug() {
  if [[ ! -f "$PLUG_VIM" ]]; then
    echo "[2/4] Installing vim-plug"
    mkdir -p "$AUTOLOAD_DIR"
    curl -fLo "$PLUG_VIM" --create-dirs \
      https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  else
    echo "[2/4] vim-plug already installed"
  fi
}

install_plugins() {
  echo "[3/4] Installing plugins via Vim/Neovim"
  if command -v nvim >/dev/null 2>&1; then
    nvim +'silent! PlugInstall --sync' +qall || true
  elif command -v vim >/dev/null 2>&1; then
    vim +'silent! PlugInstall --sync' +qall || true
  else
    echo "Neither nvim nor vim found; skipping PlugInstall. Install one and run :PlugInstall manually."
  fi
}

build_fzf() {
  echo "[4/4] Building fzf (if installed)"
  local fzf_dir=""
  if [[ -d "$HOME/.vim/plugged/fzf" ]]; then
    fzf_dir="$HOME/.vim/plugged/fzf"
  elif [[ -d "$HOME/.local/share/nvim/plugged/fzf" ]]; then
    fzf_dir="$HOME/.local/share/nvim/plugged/fzf"
  fi

  if [[ -n "$fzf_dir" ]]; then
    (cd "$fzf_dir" && ./install --all)
  else
    echo "fzf plugin not found yet. It will be built on first :PlugInstall."
  fi
}

main() {
  copy_vimrc
  install_vim_plug
  install_plugins
  build_fzf
  echo "Done. Launch Vim and enjoy!"
}

main "$@"
