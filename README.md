# VIM Config
Modern, fast, and friendly Vim setup for Vim 8+ and Neovim. Sensible defaults, curated plugins, ergonomic keymaps.

## Highlights
- Sensible defaults: relative numbers, smart search (ignorecase+smartcase), cursorline, splits to the right/below
- Robust files: backup/swap/undo directories with persistence and timestamped backups
- Better UX: Airline statusline, material theme, whitespace toggle, trailing space trim on save
- Editing power-ups: Surround, Commentary, AutoPairs, EditorConfig
- Navigation & search: fzf fuzzy finder, NERDTree file explorer
- Git integration: Fugitive and GitGutter signs

## Quick install

1) Clone the repo

```bash
git clone https://github.com/djeada/VIM-Config.git
cd VIM-Config
```

2) Copy .vimrc (Vim) or init.vim (Neovim)

```bash
# Vim
cp .vimrc ~/.vimrc

# Neovim (optional)
mkdir -p ~/.config/nvim
cp .vimrc ~/.config/nvim/init.vim
```

3) Start Vim and install plugins

Open Vim and it will auto-install vim-plug if missing. Then run:

```vim
:PlugInstall
```

Optional: you can run the helper script to do steps 2-3 automatically and ensure tools like fzf are built:

```bash
./scripts/setup.sh
```

Or use Make:

```bash
make install
```

To update plugins later:

```bash
make plug-update
```

## Requirements
- Vim 8.0+ or Neovim
- curl (for bootstrapping vim-plug)
- fzf build tools (optional): make, gcc
- On Linux for system clipboard: xclip or xsel
 - ripgrep (optional, for faster :Rg search)

## Key shortcuts
- <leader> is ","
- Toggle NERDTree: ,n
- Reveal current file in tree: ,e
- Files (fzf): ,f
- Git files (fzf): ,g
- Buffers (fzf): ,b
- Clear search highlight: ,h
- Toggle whitespace list: ,l
- Buffer next/prev: ,bn / ,bp — delete: ,bd
- Toggle relative line numbers: ,rn
- Toggle wrap: ,wr
- Toggle spell: ,ss
- Undo tree: ,u
- Align text: visual select then `ga` (vim-easy-align)
- Ripgrep search: ,r followed by query (requires ripgrep)

## Plugins
- Theme/UI: kaicataldo/material.vim, vim-airline/vim-airline, vim-airline/vim-airline-themes
- Syntax: sheerun/vim-polyglot
- Editing: tpope/vim-surround, tpope/vim-commentary, tpope/vim-repeat, jiangmiao/auto-pairs, editorconfig/editorconfig-vim, mbbill/undotree, junegunn/vim-easy-align
- Files & search: preservim/nerdtree, junegunn/fzf, junegunn/fzf.vim
- Git: tpope/vim-fugitive, airblade/vim-gitgutter

## Customization
Tweak indentation per language in `.vimrc` under the `filetype_indents` group, and adjust leader mappings to your taste.

- Local overrides: create `~/.vimrc.local` to add machine-specific tweaks; it will be sourced if present.

## Troubleshooting
- If colors look off, check `:echo has('termguicolors')` and your terminal truecolor support.
- If the clipboard doesn't work, install `xclip` or `xsel` on Linux, or set `set clipboard=` to disable integration.
- If `:Files` fails, ensure fzf is installed/built. Re-run `:PlugInstall` then `:call fzf#install()`.
 - If headless `PlugInstall` fails in CI/containers, open Vim interactively and run `:PlugInstall`.
 - If ripgrep commands fail, install `rg` and ensure it’s on PATH.

## Utilities

- Install: `./scripts/setup.sh` or `make install`
- Update plugins: `make plug-update`
- Uninstall: `./scripts/uninstall.sh` or `make uninstall`
- Health check: `./scripts/doctor.sh` to verify dependencies
- Symlink instead of copy: `./scripts/link.sh` creates symlinks for dotfiles

## Uninstall

Remove installed files and plugin directories:

```bash
./scripts/uninstall.sh
```

## CI

This repo includes a basic GitHub Actions workflow to run ShellCheck on scripts and lint `.vimrc` with `vint`.

## License
[MIT](LICENSE)
