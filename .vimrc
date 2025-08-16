" Vim configuration — modern, fast, and friendly
" ------------------------------------------------
" This file sets sensible defaults, installs a small set of productive
" plugins via vim-plug, and defines ergonomic keymaps.

" Core ---------------------------------------------------------------
" Leader early to ensure mappings pick it up
if !exists('mapleader')
	let mapleader=","  " comma leader
endif
set nocompatible
set encoding=utf-8
set modelines=0
set hidden
set ruler
set laststatus=2
set noshowmode           " statusline plugins show mode
set showcmd
set showmatch
set number
set relativenumber
set cursorline
set termguicolors
set mouse=a
set updatetime=300       " faster diagnostics/git updates
set signcolumn=yes
set splitright
set splitbelow
set scrolloff=3
set sidescrolloff=5
set confirm              " confirm :q if there are unsaved changes
set timeoutlen=400       " quicker mappings
set ttimeoutlen=50
set shortmess+=c         " reduce completion messages
set completeopt=menuone,noinsert,noselect

" Tabs/indent --------------------------------------------------------
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set smarttab
set smartindent
set noshiftround
set wrap

" Search -------------------------------------------------------------
set hlsearch
set incsearch
set ignorecase
set smartcase

" Completion ---------------------------------------------------------
set wildmenu
set wildmode=list:longest,full
set wildignore+=*.o,*.obj,*.pyc,*.class,*.swp,*.zip,*.tar,*.gz,*.DS_Store

" Files, backups, undo ----------------------------------------------
set backup
set writebackup
set swapfile
set undofile
let s:vim_data = has('nvim') ? stdpath('data') : expand('~/.vim')
let &backupdir = s:vim_data . '/backup//'
let &directory = s:vim_data . '/swap//'
let &undodir   = s:vim_data . '/undo//'
if !isdirectory(&backupdir) | call mkdir(&backupdir, 'p', 0700) | endif
if !isdirectory(&directory) | call mkdir(&directory, 'p', 0700) | endif
if !isdirectory(&undodir)   | call mkdir(&undodir,   'p', 0700) | endif

" Backup file suffix: _YYYY-MM-DD.HH:MM
augroup file_backup_suffix
	autocmd!
	autocmd BufWritePre * let &bex = '_' . strftime('%F.%H:%M')
augroup END

" Clipboard (requires xclip/win32yank on some systems) ---------------
if has('clipboard')
	set clipboard^=unnamed,unnamedplus
endif

" Visualize whitespace -----------------------------------------------
set listchars=tab:▸\ ,trail:•,extends:…,precedes:…
nnoremap <leader>l :set list!<CR>

" Mappings -----------------------------------------------------------
nnoremap j gj
nnoremap k gk
nnoremap <leader>h :nohlsearch<CR>
nnoremap <leader>w :write<CR>
nnoremap <leader>q :quit<CR>
vnoremap <leader>q gq
nnoremap <leader>bd :bdelete<CR>
nnoremap <leader>bn :bnext<CR>
nnoremap <leader>bp :bprevious<CR>

" QoL toggles
nnoremap <leader>rn :set relativenumber! number!<CR>
nnoremap <leader>wr :set wrap!<CR>
nnoremap <leader>ss :setlocal spell! spelllang=en<CR>

" Write with sudo if forgotten to elevate
cnoremap w!! execute 'silent! write !sudo tee % >/dev/null' | edit!

" Smarter search pattern by default (very magic)
nnoremap / /\v
vnoremap / /\v

" Trim trailing whitespace on save (except for markdown)
augroup trim_trailing_ws
	autocmd!
	autocmd BufWritePre * if &ft !=# 'markdown' | silent! %s/\s\+$//e | endif
augroup END

" Filetype-specific indentation
augroup filetype_indents
	autocmd!
	autocmd FileType python setlocal tabstop=4 shiftwidth=4 softtabstop=4 expandtab
	autocmd FileType javascript,typescript,typescriptreact,javascriptreact,json,yaml,html,css,scss setlocal tabstop=2 shiftwidth=2 softtabstop=2 expandtab
augroup END

" Plugin manager (vim-plug) -----------------------------------------
" Determine autoload target
let s:is_nvim = has('nvim')
let s:plug_autoload = s:is_nvim ? stdpath('data') . '/site/autoload/plug.vim' : expand('~/.vim/autoload/plug.vim')
let s:plug_dir = s:is_nvim ? stdpath('data') . '/plugged' : expand('~/.vim/plugged')

" Auto-install vim-plug if missing
if empty(glob(s:plug_autoload))
	if executable('curl')
		execute 'silent !curl -fLo ' . fnameescape(s:plug_autoload) . ' --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
		autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
	endif
endif

call plug#begin(s:plug_dir)
	" UI & theme
	Plug 'kaicataldo/material.vim', { 'branch': 'main' }
	Plug 'vim-airline/vim-airline'
	Plug 'vim-airline/vim-airline-themes'

	" Language packs & syntax
	Plug 'sheerun/vim-polyglot'

	" Editing power-ups
	Plug 'tpope/vim-surround'
	Plug 'tpope/vim-commentary'
	Plug 'tpope/vim-repeat'
	Plug 'jiangmiao/auto-pairs'
	Plug 'editorconfig/editorconfig-vim'
	Plug 'mbbill/undotree'
	Plug 'junegunn/vim-easy-align'

	" Files & fuzzy finding
	Plug 'preservim/nerdtree'
	Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
	Plug 'junegunn/fzf.vim'

	" Git integration
	Plug 'tpope/vim-fugitive'
	Plug 'airblade/vim-gitgutter'
call plug#end()

syntax on
filetype plugin indent on

" Colors & statusline ------------------------------------------------
try
	colorscheme material
catch
	" fallback to default if theme missing
endtry
let g:airline_powerline_fonts = 1
let g:airline_theme = 'dark'

" Plugin keymaps -----------------------------------------------------
nnoremap <leader>n :NERDTreeToggle<CR>
nnoremap <leader>e :NERDTreeFind<CR>
nnoremap <leader>f :Files<CR>
nnoremap <leader>g :GFiles<CR>
nnoremap <leader>b :Buffers<CR>
nnoremap <leader>u :UndotreeToggle<CR>

" EasyAlign
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

" Ripgrep-powered search (if rg is available)
if executable('rg')
	set grepprg=rg\ --vimgrep\ --smart-case
	set grepformat=%f:%l:%c:%m
	command! -nargs=* -complete=file Rg silent grep <args> | copen
	nnoremap <leader>r :Rg<Space>
endif

" Source local overrides if present
if filereadable(expand('~/.vimrc.local'))
	execute 'source' fnameescape(expand('~/.vimrc.local'))
endif

" End of config ------------------------------------------------------
