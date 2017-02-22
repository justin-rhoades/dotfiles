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
set relativenumber

" Search stuff!
set complete=.,b,u,]
set wildmode=longest,list:longest
set completeopt=menu,preview

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
set numberwidth=4

set nocompatible


filetype off
set rtp+=~/sites/dotfiles/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-rails'
Plugin 'elixir-lang/vim-elixir'
Plugin 'tpope/vim-endwise'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'thoughtbot/vim-rspec'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-ragtag'
Plugin 'tpope/vim-eunuch'
Plugin 'tpope/vim-commentary'
Plugin 'jiangmiao/auto-pairs'
Plugin 'airblade/vim-gitgutter'
Plugin 'mxw/vim-jsx'
Plugin 'kchmck/vim-coffee-script'
Plugin 'mattn/emmet-vim'
Plugin 'vim-syntastic/syntastic'
Plugin 'tpope/vim-dispatch'
Plugin 'rakr/vim-one'

call vundle#end()
filetype plugin indent on

if (empty($TMUX))
  if (has("nvim"))
    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  if (has("termguicolors"))
    set termguicolors
  endif
endif
syntax on
set background=dark
colorscheme one
set re=1

let g:airline#extensions#branch#enabled=1

" enable vim/ragtag
let g:ragtag_global_maps = 1

let g:rspec_command = 'Dispatch rspec {spec}'
"let g:rspec_command = 'compiler rspec | set makeprg=zeus | Make rspec {spec}'


set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:synatsic_enable_signs = 1

" The Silver Searcher
if executable('ag')
  set grepprg=ag\ --nogroup\ --nocolor
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
  let g:ctrlp_use_caching = 0
endif

nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>

imap jj <esc>
imap <Tab> <C-P>
map <Leader>bb :!bundle install<CR>
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>

nnoremap <C-J> <C-W><C-J>
nnoremap <C-H> <C-W><C-H>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
" line wrapping helo
nmap k gk
nmap j gj
