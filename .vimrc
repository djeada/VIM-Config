" Compatibility
set nocompatible

" Filetype detection
filetype off
syntax on
filetype plugin indent on

" Modelines
set modelines=0

" Line numbers
set number
set ruler

" Disable visual bell
set novisualbell

" Word wrap
set wrap

" Tabs
set tabstop=4
set shiftwidth=4
set smarttab
set expandtab
set smartindent
set softtabstop=2
set noshiftround

" Enhanced movement
nnoremap j gj
nnoremap k gk

" Faster terminal rendering
set ttyfast

" Status bar
set laststatus=2

" Show mode, command and search match in status line
set showmode
set showcmd
set showmatch

" Search options
nnoremap / /\v
vnoremap / /\v
set hlsearch
set incsearch
set ignorecase
set smartcase
map <leader><space> :let @/=''<cr> " clear search highlight

" Formatting
map <leader>q gqip

" Tabs and EOL visualization
set listchars=tab:▸\ ,eol:¬
map <leader>l :set list!<CR> " toggle tabs and EOL visualization

" Backup settings
set backup
set writebackup
set backupdir=~/.vim/backup//

" Backup file format: file_name_YYYY-MM-DD.HH:MM
au BufWritePre * let &bex = '_' . strftime("%F.%H:%M")

" Plugins
call plug#begin('~/.vim/plugged')
Plug 'kaicataldo/material.vim', { 'branch': 'main' }
call plug#end()

" Colorscheme
colorscheme material

" Tab completion and mouse support
set wildmenu
set mouse=a
