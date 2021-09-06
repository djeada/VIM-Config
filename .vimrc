set nocompatible
filetype off
syntax on
filetype plugin indent on
set modelines=0
set number
set ruler

set novisualbell

" Whitespace
set wrap
set tabstop=4
set shiftwidth=4
set smarttab
set expandtab
set smartindent
set softtabstop=2
set noshiftround

" Move up/down editor lines
nnoremap j gj
nnoremap k gk

" Rendering
set ttyfast

" Status bar
set laststatus=2

" Last line
set showmode
set showcmd

" Searching
nnoremap / /\v
vnoremap / /\v
set hlsearch
set incsearch
set ignorecase
set smartcase
set showmatch
map <leader><space> :let @/=''<cr> " clear search

" Formatting
map <leader>q gqip

" Visualize tabs and newlines
set listchars=tab:▸\ ,eol:¬
map <leader>l :set list!<CR> " Toggle tabs and EOL

" Vim backup
set backup
set writebackup
set backupdir=~/.vim/backup//

" backup names in following format: file_name_2015-04-05.14:59
au BufWritePre * let &bex = '_' . strftime("%F.%H:%M")

call plug#begin('~/.vim/plugged')
Plug 'kaicataldo/material.vim', { 'branch': 'main' }
call plug#end()

colorscheme material
