" install Plug manager if it not installed
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

Plug 'NLKNguyen/papercolor-theme'
" Plug 'ayu-theme/ayu-vim'

Plug 'scrooloose/nerdtree'
" Plug 'dense-analysis/ale'
Plug 'junegunn/fzf.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'tpope/vim-commentary'

Plug 'rhysd/vim-notes-cli'
Plug 'xolox/vim-notes'
Plug 'guljeny/vim-fullscreen'
Plug 'guljeny/aliapath'
Plug 'tpope/vim-fugitive'

" --- langs spec ----
Plug 'pangloss/vim-javascript'
Plug 'kchmck/vim-coffee-script'
Plug 'slim-template/vim-slim'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'ap/vim-css-color'
Plug 'elzr/vim-json'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
call plug#end()

" ----------- MAIN ------------
set encoding=utf-8
set conceallevel=0
set path=$PWD/**
set langmenu=en_US
let $LANG = 'en_US' " set en locale for ru systems
set noerrorbells
set noswapfile
set hlsearch
set smartcase
set ignorecase " search comands in any case
set undofile
set incsearch
set showcmd
set nu " enable line numbers
au! BufNewFile,BufReadPost *.{yaml,yml} set filetype=yaml foldmethod=indent " folding yaml
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o " disable auto comments
let mapleader = "\<Space>" " set leader key
set mouse= " disable mouse
set backspace=indent,eol,start " normalize backspace work
set backspace=2

" ------- DEFAULT COMMANDS & BINDS -------
command! CopyFilePath let @+ = expand('%')
command! W w
map <leader>t :tabnew<CR>
map <leader>w :tabnext<CR>
map <leader>q :tabprevious<CR>
map <leader>f :NERDTreeFind<CR>
map <leader>n :NERDTree<CR>
map <leader>v :vsplit<CR>
map <leader>h :split<CR>
map Y "+y
map <leader>p "0p
map U <C-r>
tnoremap <C-q> <C-\><C-n>
map <leader>s :Fullscreen<CR>

" --------- FOLDING -------
set foldenable
set foldmethod=syntax
set foldnestmax=3
set foldlevel=3

" -------- INDENTATION ---------
set autoindent
set smartindent
set tabstop=2 softtabstop=2 shiftwidth=2 expandtab

" -------- AUTOCOMPLIT -------
set completeopt="menu"
let g:ycm_filepath_blacklist = {'*': 1}

" -------- SEARCH --------
" map <leader-f> :Ag<CR>
" map <leader-p> :Files<CR>
let $FZF_DEFAULT_COMMAND = 'ag --hidden --ignore .git -l -g ""'
" let g:fzf_preview_window = ['downd:40%', 'ctrl-/']

" -------- STYLING -------
set termguicolors
set background=light
colorscheme PaperColor
" let ayucolor="light" " mirage  | light | dark
" colorscheme ayu

" ------ ALE LINT ------
let g:ale_linters = {
\   'javascript': ['eslint'],
\}

" ----- ALIA PATH -----

map <leader>o :OpenPath<CR>
:set suffixesadd+=.js
:set suffixesadd+=.es6.js
:set suffixesadd+=.json
:set suffixesadd+=.scss
:set wildignore+=**/node_modules/**
:set wildignore+=**/tmp/**
:set wildignore+=**/bin/**
:set wildignore+=**/cache/**
:set wildignore+=**/db/**

" ----- COC -------

inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
