let mapleader = " "

set backspace=2
set nobackup
set nowritebackup
set noswapfile
set ruler
set showcmd
set incsearch
set laststatus=2
set autowrite

" Softtabs, 2 spaces
set tabstop=2
set shiftwidth=2
set shiftround
set expandtab

" display extra whitespace
set list listchars=tab:»·,trail:·,nbsp:·

" use one space, not two after punctuation
set nojoinspaces

" make it clear where 80 chars is
set textwidth=80
set colorcolumn=+1

" numbers!
set number
set numberwidth=5

set nocompatible
filetype off

set termguicolors
syntax on
colorscheme onedark

set rtp+=~/sites/dotfiles/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-endwise'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'thoughtbot/vim-rspec'
Plugin 'joshdick/airline-onedark.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'elixir-lang/vim-elixir'

call vundle#end()
filetype plugin indent on

let g:airline#extensions#branch#enabled=1

imap jj <esc>
map <Leader>bb :!bundle install<CR>
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>

" line wrapping helo
nmap k gk
nmap j gj
