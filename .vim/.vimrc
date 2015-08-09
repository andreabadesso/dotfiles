set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Bundle 'gmarik/Vundle.vim'

Bundle 'tpope/vim-surround'
Bundle 'gcmt/breeze.vim'
Bundle 'kien/ctrlp.vim'
Bundle 'SirVer/ultisnips'
" Bundle 'tomtom/tcomment_vim'
Bundle 'bling/vim-airline'
" Bundle 'airblade/vim-gitgutter'
Plugin 'Lokaltog/powerline'
Plugin 'scrooloose/nerdtree'
Plugin 'jwhitley/vim-matchit'
" Plugin 'Valloric/YouCompleteMe'
Plugin 'marijnh/tern_for_vim'
Plugin 'mattn/emmet-vim'
" Bundle "wookiehangover/jshint.vim"
Plugin 'kien/rainbow_parentheses.vim'
Plugin 'Valloric/YouCompleteMe'

" Testing:
" Plugin 'osyo-manga/vim-marching'
" Plugin 'Shougo/neocomplete.vim'

" GIT
Bundle 'tpope/vim-fugitive'
Bundle 'gregsexton/gitv'

" Themes
Bundle 'flazz/vim-colorschemes'
Plugin 'benjaminwhite/Benokai'
Bundle 'morhetz/gruvbox'
Plugin 'trusktr/seti.vim'
Plugin 'tpope/vim-vividchalk'
Plugin 'chriskempson/vim-tomorrow-theme'

" CSS
" Plugin 'skammer/vim-css-color'
Plugin 'ap/vim-css-color'

" Javascript
Plugin 'othree/javascript-libraries-syntax.vim'
Bundle 'geekjuice/vim-mocha'
Plugin 'othree/html5.vim'
Plugin 'leshill/vim-json'
Plugin 'maksimr/vim-jsbeautify'
Plugin 'einars/js-beautify'
Plugin 'myhere/vim-nodejs-complete'
Plugin 'heavenshell/vim-jsdoc'
Plugin 'jelera/vim-javascript-syntax'
Plugin 'goatslacker/mango.vim'

" Time tracking:
Bundle 'wakatime/vim-wakatime'

" Snipmate
" Bundle "MarcWeber/vim-addon-mw-utils"
" Bundle "tomtom/tlib_vim"
" Bundle "garbas/vim-snipmate"

" Extra Snippets
Bundle "honza/vim-snippets"

call vundle#end() " required
set t_Co=256

colorscheme gruvbox
" colorscheme Tomorrow-Night-Blue
set background=dark
" colorscheme seti

" Javascript Libraries Syntax:
let g:used_javascript_libs = 'jquery,underscore,angularjs,jasmine'

" Snipmate toggle:
imap <C-J> <Plug>snipMateNextOrTrigger
smap <C-J> <Plug>snipMateNextOrTrigger

if has('autocmd')
  filetype plugin indent on
endif
if has('syntax') && !exists('g:syntax_on')
  syntax enable
endif

set autoindent
set backspace=indent,eol,start
set complete-=i

" Remove Scratch window:
set completeopt-=preview
set showmatch
set showmode
set smarttab
" PEP8 line limit:
set colorcolumn=80
set nrformats-=octal
set shiftround
set ttimeout
set ttimeoutlen=50

set incsearch
" Use <C-L> to clear the highlighting of :set hlsearch.
if maparg('<C-H>', 'n') ==# ''
  nnoremap <silent> <C-L> :nohlsearch<CR><C-L>
endif

set laststatus=2
set ruler
set showcmd
set wildmenu
set autoread
set encoding=utf-8
set tabstop=4 shiftwidth=4 expandtab
set listchars=tab:▒░,trail:▓
set list

inoremap <C-U> <C-G>u<C-U>

set number
set hlsearch
set ignorecase
set smartcase

" Necessário para o powerline funcionar no MacVim
set guifont=Source\ Code\ Pro\ for\ Powerline\ 12
" set guifont=ProggyCleanTT\ 12

" Remove a scrollbar na direita e esquerda do MacVim
set guioptions-=r
set guioptions-=R
set guioptions-=L

" Ilumina a linha atual:
set cursorline

" Don't use Ex mode, use Q for formatting
map Q gq

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

" do not history when leavy buffer
set hidden

set nobackup
set nowritebackup
set noswapfile
set fileformats=unix,dos,mac

" exit insert mode
inoremap <C-c> <Esc>

" set completeopt=menuone,longest,preview

"
" Plugins config
"

" CtrlP
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*
let g:ctrlp_custom_ignore = {
  \ 'dir':  'node_modules\|DS_Store\|git\|bower_components',
  \ 'file': '\v\.(exe|so|dll)$',
  \ }

" UltiSnip
" <C-j> para o UltiSnip não sobreescrever o <tab>
let g:UltiSnipsExpandTrigger="<C-j>"
let g:UltiSnipsSnippetsDir="~/.vim-snippets/angular-vim-snippets/UltiSnips"
let g:UltiSnipsJumpForwardTrigger="<C-j>"
let g:UltiSnipsJumpBackwardTrigger="<C-k>"
let g:did_UltiSnips_vim_after = 1

" vim-airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline_powerline_fonts = 1

" YouCompleteMe:
let g:ycm_register_as_syntastic_checker = 0

"
" Basic shortcuts definitions
"  most in visual mode / selection (v or ⇧ v)
"

" Find
map <C-f> /
" indend / deindent after selecting the text with (⇧ v), (.) to repeat.
vnoremap <Tab> >
vnoremap <S-Tab> <
" comment / decomment & normal comment behavior
vmap <C-m> gc
" Disable tComment to escape some entities
let g:tcomment#replacements_xml={}
" Text wrap simpler, then type the open tag or ',"
vmap <C-w> S
" Cut, Paste, Copy
vmap <C-x> d
vmap <C-v> p
vmap <C-c> y
" Undo, Redo (broken)
nnoremap <C-z>  :undo<CR>
inoremap <C-z>  <Esc>:undo<CR>
nnoremap <C-y>  :redo<CR>
inoremap <C-y>  <Esc>:redo<CR>

" Tabs
let g:airline_theme='badwolf'
let g:airline#extensions#tabline#enabled = 1
nnoremap <C-b>  :tabprevious<CR>
inoremap <C-b>  <Esc>:tabprevious<CR>i
nnoremap <C-n>  :tabnext<CR>
inoremap <C-n>  <Esc>:tabnext<CR>i
nnoremap <C-t>  :tabnew<CR>
inoremap <C-t>  <Esc>:tabnew<CR>i
nnoremap <C-k>  :tabclose<CR>
inoremap <C-k>  <Esc>:tabclose<CR>i

" lazy ':'
map \ :
map ; :

let mapleader = ','
nnoremap <Leader>p :set paste<CR>
nnoremap <Leader>o :set nopaste<CR>
noremap  <Leader>g :GitGutterToggle<CR>
noremap <Leader>nt :NERDTreeToggle<CR>

" Carrega configurações extra da maquina
if filereadable(expand("~/.vimrc.local"))
  source ~/.vimrc.local
endif

runtime macros/matchit.vim
