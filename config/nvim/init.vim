set nocompatible "Needed by Vundle
filetype off "Needed by Vundle
set rtp+=~/.vim/bundle/Vundle.vim "Add Vundle to runtime path
set rtp+=~/.fzf

call vundle#begin()
  Plugin 'VundleVim/Vundle.vim' " Vundle
  Plugin 'vim-airline/vim-airline' "Cool statusline
  Plugin 'vim-airline/vim-airline-themes' "Airline themes
  Plugin 'Shougo/neocomplete.vim' "Tab-complete code
  Plugin 'tpope/vim-surround' "Better deletion of brackets, parens, etc.
  Plugin 'notpratheek/vim-luna' "Nice theme
  Plugin 'https://notabug.org/SylvieLorxu/vim-betterK.git' "Improve K command
  Plugin 'junegunn/fzf.vim' " the greatest plugin ever
  Plugin 'ericcurtin/CurtineIncSw.vim' "quickly switch between header & source
call vundle#end()

" Set up colorscheme
" Manually force all available colors
" and up colors.
syntax enable
set background=dark
colorscheme luna-term
hi Comment guifg=#5C6370 ctermfg=59
"   Range:   233 (darkest) ~ 238 (lightest)
"   Default: 235

" Airline-vim
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = '>'
let g:airline_theme='luna'

" YouCompleteMe -- Don't ask to use local extras
let g:ycm_confirm_extra_conf = 0

" vim-terrafrom
let g:terraform_align=1
let g:terraform_fmt_on_save=1

" fzf ctrl+p compatibily
nnoremap <C-p> :Files<Cr>

" fzf ctrl+f for ripgrep
nnoremap <C-f> :Rg<Cr>

" [Tags] Command to generate tags file
let g:fzf_tags_command = 'ctags -R'

" Sets line numbers
set number
set relativenumber

" Tab key adds 4 spaces,
" pushing delete will delete the 4 spaces as if it were a tab character
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab

" Fix my backspaces
set backspace=indent,eol,start

" Reload files modified outside vim
set autoread

" set hlsearch
set hlsearch

" Improve performance, especially with macros
set lazyredraw

" Use Unix as the standard file type
set ffs=unix,dos,mac

" Set utf8 to standard encoding
set encoding=utf8

" Turn on regex
set magic

" Always preference reading off disk
set autoread

" Intelligent indentation & tabs
set autoindent
set smartindent
set smarttab

" Case insensitive search, except with capital letters
set ignorecase
set smartcase

" No backup
set noswapfile

" Show commands
set showcmd

" Show current position
set ruler

" Enable filetype detection
filetype on
filetype plugin on
filetype indent on

" Delete trailing whitespace on save
autocmd BufWritePre * :%s/\s\+$//e

" RSI makes me sad
set mouse=a

" Mathew cha line wrapping magic
noremap <silent> k gk
noremap <silent> j gj
noremap <silent> 0 g0
noremap <silent> $ g$

" Preferences for various file formats
set tw=79
set cc=79
autocmd FileType text setlocal tw=79
autocmd FileType yaml setlocal et ts=2 sw=2
autocmd FileType make setlocal noexpandtab shiftwidth=8 softtabstop=0
autocmd FileType gitcommit setlocal tw=72

autocmd FileType c setlocal tabstop=4 shiftwidth=4 expandtab tw=80 cc=80
autocmd FileType h setlocal tabstop=4 shiftwidth=4 expandtab tw=80 cc=80
autocmd FileType cpp setlocal tabstop=4 shiftwidth=4 expandtab tw=80 cc=80
autocmd FileType sh setlocal expandtab tabstop=2 softtabstop=2 shiftwidth=2
autocmd FileType python setlocal expandtab tabstop=4 shiftwidth=4
autocmd BufNewFile,BufRead *.sql setlocal expandtab tabstop=2 softtabstop=2 shiftwidth=2
autocmd BufNewFile,BufRead *.ts setlocal expandtab tabstop=2 softtabstop=2 shiftwidth=2
autocmd BufNewFile,BufRead *.js setlocal expandtab tabstop=2 softtabstop=2 shiftwidth=2
autocmd BufNewFile,BufRead *.html setlocal expandtab tabstop=2 softtabstop=2 shiftwidth=2
autocmd BufNewFile,BufRead *.css setlocal expandtab tabstop=2 softtabstop=2 shiftwidth=2
autocmd BufNewFile,BufRead *.xml setlocal tw=109 shiftwidth=2 smarttab

"Save as sudo with w!! (when lacking root)
cmap w!! w !sudo tee % >/dev/null

" Ctrl+\ to up function definition in vertical split
map <C-\> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>

" Toggle hlsearch with F1
nnoremap <F1> :set hlsearch!<CR>

" Toggle paste with F2
nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>
set showmode

" Toggle line numbers with F3
nnoremap <F3> :set norelativenumber! nonumber!<CR>

" Switch between headers and source with F4
nnoremap <F5> :call CurtineIncSw()<CR>
