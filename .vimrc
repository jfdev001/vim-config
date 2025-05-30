set nocompatible              " required
filetype off                  " required

" set the runtime path to include Vundle and initialize
if isdirectory(expand('~/.vim/bundle/Vundle.vim'))
    set rtp+=~/.vim/bundle/Vundle.vim
    call vundle#begin()

    " alternatively, pass a path where Vundle should install plugins
    "call vundle#begin('~/some/path/here')

    " let Vundle manage Vundle, required
    Plugin 'gmarik/Vundle.vim'
    Plugin 'JuliaEditorSupport/julia-vim'
    Plugin 'davidhalter/jedi-vim'
    Plugin 'wellle/tmux-complete.vim'
    Plugin 'dense-analysis/ale'

    " add all your plugins here (note older versions of Vundle
    " used Bundle instead of Plugin)

    " ...
    "
    " All of your Plugins must be added before the following line
    call vundle#end()            " required
else 
    echo "Cloning vundle"
    !git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
    echo "Make sure to call :PluginInstall"
endif 

if !filereadable(expand('~/.vim/bundle/comments.vim'))
    echo "wget the comments"
    !curl -L https://github.com/jfdev001/vim-config/raw/refs/heads/main/comments.vim -o ~/.vim/bundle/comments.vim
else
    source ~/.vim/bundle/comments.vim
endif

set encoding=utf-8
syntax on
" filetype plugin indent on    " required
filetype plugin on " due to julia
let g:latex_to_unicode_auto = 1 " for julia

" Minimalist commands (i.e., no syntax related support) 
set tabstop=4 shiftwidth=4 expandtab
set number
" 80 is python, 92 is julia
set colorcolumn=80,92
set laststatus=2
set statusline=%F%r
" https://www.warp.dev/terminus/searching-in-vim
set hlsearch
" https://stackoverflow.com/questions/49297579/how-to-count-search-results-in-vim
set shortmess-=S
" https://stackoverflow.com/questions/2287440/how-to-do-case-insensitive-search-in-vim
" set ignorecase
" set t_Co=256
" set termencoding=utf-8

" Next line: This is for bash and python right and possibly makefile?
" autocmd FileType make setlocal noexpandtab

" CTRL + A to go to beginning of line
map <C-a> <ESC>^
imap <C-a> <ESC>I

" CTRL + E to go to end of line
map <C-e> <ESC>$
imap <C-e> <ESC>A

" Next lines: unused.. pasted a long time ago from some stack overflow thing..
" inoremap <M-f> <ESC><Space>Wi
" inoremap <M-b> <Esc>Bi
" inoremap <M-d> <ESC>cW

" clang complete configuration
" https://github.com/xavierd/clang_complete
let g:clang_library_path='/usr/lib/x86_64-linux-gnu/libclang-14.so.1'

" tmux complete stuff
" let g:tmuxcomplete#trigger = 'completefunc'
let g:tmuxcomplete#trigger = 'omnifunc'

set number
nnoremap <F2> :set nonumber!<CR>

set belloff=all
