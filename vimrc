" Use Pathogen for plugins
execute pathogen#infect()

" Syntax highlighting
syntax on

" Show line numbers
set number

" Save as sudo if permission denied
command W w !sudo tee % > /dev/null

" Ignore case on search
set ignorecase

" When searching, be smart about case
set smartcase

" Highlight search results
set hlsearch

" Indenting
filetype plugin indent on

" For salt-vim
set nocompatible

" Start nerdtree if no file is specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" CTRL+n for nerdtree
map <C-n> :NERDTreeToggle<CR>

" Close vim if nerdtree is the only window left open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
