#!/usr/bin/env bash
set -euo pipefail

# Simple health checks for common dependencies

ok() { printf "[OK] %s\n" "$1"; }
warn() { printf "[WARN] %s\n" "$1"; }
fail() { printf "[FAIL] %s\n" "$1"; }

check_cmd() {
  if command -v "$1" >/dev/null 2>&1; then ok "$1 found"; else warn "$1 not found"; fi
}

check_vim_plug() {
  local vim_plug="$HOME/.vim/autoload/plug.vim"
  local nvim_plug="$HOME/.local/share/nvim/site/autoload/plug.vim"
  if [[ -f "$vim_plug" || -f "$nvim_plug" ]]; then
    ok "vim-plug installed"
  else
    warn "vim-plug not found"
  fi
}

main() {
  check_cmd vim || true
  check_cmd nvim || true
  check_cmd curl || true
  check_cmd rg || true
  check_cmd xclip || true
  check_cmd xsel || true
  check_cmd git || true
  check_vim_plug
}

main "$@"
