    set nocompatible
    filetype off
    set rtp+=~/.vim/bundle/Vundle.vim
    call vundle#begin()

    " Vundle
    Bundle 'gmarik/Vundle.vim'
    Bundle 'tpope/vim-surround'
    Bundle 'kien/ctrlp.vim'
    Bundle 'SirVer/ultisnips'
    " Bundle 'bling/vim-airline'
    Plugin 'Lokaltog/powerline'
    Plugin 'scrooloose/nerdtree'
    Plugin 'jwhitley/vim-matchit'
    Plugin 'marijnh/tern_for_vim'
    Plugin 'mattn/emmet-vim'
    Plugin 'Valloric/YouCompleteMe'
    Plugin 'elixir-lang/vim-elixir'
    " Plugin 'scrooloose/syntastic'

    " Python
    Plugin 'nvie/vim-flake8'

    " GIT
    Bundle 'tpope/vim-fugitive'

    " Themes
    Bundle 'https://github.com/andreabadesso/gruvbox'
    Bundle 'chriskempson/base16-vim'
    Bundle 'reedes/vim-colors-pencil'

" CSS
" Bundle 'ap/vim-css-color'

" HTML
" Bundle 'gcmt/breeze.vim'

" Javascript
Plugin 'othree/javascript-libraries-syntax.vim'
" Plugin 'othree/html5.vim'
Plugin 'maksimr/vim-jsbeautify'
Plugin 'myhere/vim-nodejs-complete'
Plugin 'jelera/vim-javascript-syntax'
Plugin 'godlygeek/tabular'

" Time tracking:
Bundle 'wakatime/vim-wakatime'

" Extra Snippets
Bundle "honza/vim-snippets"

call vundle#end() " required

set t_Co=256
set background=dark
set term=screen-256color

colorscheme gruvbox
" colorscheme base16-default
" colorscheme pencil

if has('autocmd')
  filetype plugin indent on
endif
if has('syntax') && !exists('g:syntax_on')
   syntax enable
endif


" Javascript Libraries Syntax:
let g:used_javascript_libs = 'jquery,underscore,angularjs,jasmine'

" Snipmate toggle:
imap <C-J> <Plug>snipMateNextOrTrigger
smap <C-J> <Plug>snipMateNextOrTrigger

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
" Trying to speed up vim:
set ttyfast
set ttyscroll=3
set lazyredraw " to avoid scrolling problems
set synmaxcol=128

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
set guifont=Source\ Code\ Pro\ for\ Powerline:h13
" set guifont=ProggyCleanTT\ 12

" Remove fugly scrollbars in MacVim
set guioptions-=r
set guioptions-=R
set guioptions-=L

" Highlights current line
set cursorline

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

" Do not history when leavy buffer
set hidden
set nobackup
set nowritebackup
set noswapfile
set fileformats=unix,dos,mac

" exit insert mode
inoremap <C-c> <Esc>

" set completeopt=menuone,longest,preview

" Plugins config

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
let g:airline#extensions#tabline#enabled = 0
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline_powerline_fonts = 1
"let g:airline_theme='badwolf'
let g:airline_theme='base16'
" YouCompleteMe:
let g:ycm_register_as_syntastic_checker = 0
" Disable tComment to escape some entities
let g:tcomment#replacements_xml={}
let mapleader = ','
let loaded_matchparen = 1
"let g:matchparen_timeout = 10
"let g:matchparen_insert_timeout = 10

" Maps
map ; :
map Q gq
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
nnoremap <Leader>p :set paste<CR>
nnoremap <Leader>o :set nopaste<CR>
noremap  <Leader>g :GitGutterToggle<CR>
noremap <Leader>nt :NERDTreeToggle<CR>
nmap <silent> ,/ :nohlsearch<CR>

" Forgot to sudo vim, write file with :w!!
cmap w!! w !sudo tee % >/dev/null

" Carrega configurações extras da maquina
if filereadable(expand("~/.vimrc.local"))
  source ~/.vimrc.local
endif

" Trying to improve speed on osx:
set ttimeout
set ttimeoutlen=250
set notimeout

filetype plugin indent on
" show existing tab with 4 spaces width
set tabstop=4
" when indenting with '>', use 4 spaces width
set shiftwidth=4
" On pressing tab, insert 4 spaces
set expandtab

runtime macros/matchit.vim
