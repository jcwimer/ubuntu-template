execute pathogen#infect()
syntax on
let g:NERDTreeDirArrows=0
set number
set noautoindent
set nocindent
set nosmartindent
set softtabstop=2
set shiftwidth=2
set expandtab
colorscheme elflord
set encoding=utf-8

set colorcolumn=100
au BufRead,BufNewFile *.pp set filetype=ruby
autocmd BufWritePre * %s/\s\+$//e