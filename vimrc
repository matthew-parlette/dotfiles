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
