 call plug#begin('~/.config/nvim/plugged')

" Plug 'chriskempson/base16-vim'
" Plug 'ctrlpvim/ctrlp.vim' " fuzzy file finder, mapped to <leader>t
" Plug 'tpope/vim-ragtag' " endings for html, xml, etc. - ehances surround
" Plug 'benmills/vimux' " tmux integration for vim
" Plug 'tpope/vim-repeat' " enables repeating other supported plugins with the . command

Plug 'ryanoasis/vim-devicons'
Plug 'scrooloose/nerdtree', { 'on': ['NERDTreeToggle', 'NERDTreeFind'] } | Plug 'Xuyuanp/nerdtree-git-plugin' | Plug 'ryanoasis/vim-devicons'
Plug 'tpope/vim-surround' " mappings to easily delete, change and add such surroundings in pairs, such as quotes, parens, etc.
Plug 'vim-airline/vim-airline' " fancy statusline
Plug 'vim-airline/vim-airline-themes' " themes for vim-airline
" Plug 'benekastah/neomake' " neovim replacement for syntastic using neovim's job control functonality
Plug 'tpope/vim-fugitive' " amazing git wrapper for vim
Plug 'garbas/vim-snipmate' " snippet manager
Plug 'editorconfig/editorconfig-vim' " .editorconfig support
Plug 'MarcWeber/vim-addon-mw-utils' " interpret a file by function and cache file automatically
Plug 'tomtom/tlib_vim' " utility functions for vim
Plug 'ervandew/supertab' " Perform all your vim insert mode completions with Tab
Plug 'tpope/vim-dispatch' " asynchronous build and test dispatcher
Plug 'vim-scripts/matchit.zip' " extended % matching
Plug 'sickill/vim-pasta' " context-aware pasting

" language-specific plugins
Plug 'mattn/emmet-vim', { 'for': 'html' } " emmet support for vim - easily create markdup wth CSS-like syntax
Plug 'gregsexton/MatchTag', { 'for': 'html' } " match tags in html, similar to paren support
Plug 'othree/html5.vim', { 'for': 'html' } " html5 support
Plug 'pangloss/vim-javascript', { 'for': 'javascript' } " JavaScript support
Plug 'moll/vim-node', { 'for': 'javascript' } " node support

Plug 'jelera/vim-javascript-syntax', { 'for': 'javascript' } " JavaScript syntax plugin
Plug 'othree/yajs.vim', { 'for': 'javascript' } " JavaScript syntax plugin
Plug 'elzr/vim-json', { 'for': 'json' } " JSON support
Plug 'Shougo/vimproc.vim', { 'do': 'make' } " interactive command execution in vim
Plug 'leafgarland/typescript-vim', { 'for': 'typescript' } " typescript support
Plug 'cakebaker/scss-syntax.vim', { 'for': 'scss' } " sass scss syntax support
Plug 'hail2u/vim-css3-syntax', { 'for': 'css' } " CSS3 syntax support
Plug 'itspriddle/vim-marked', { 'for': 'markdown', 'on': 'MarkedOpen' } " Open markdown files in Marked.app - mapped to <leader>m
Plug 'tpope/vim-markdown', { 'for': 'markdown' } " markdown support

" Notetaking
Plug 'xolox/vim-misc'
Plug 'Xolox/vim-notes'

" Tracking
Plug 'wakatime/vim-wakatime'

" Theme
Plug 'morhetz/gruvbox'

call plug#end()

" }}}

" Section General {{{
"
set nocompatible " not compatible with vi
set autoread " detect when a file is changed

" make backspace behave in a sane manner
set backspace=indent,eol,start

" set a map leader for more key combos
let mapleader = ','
let g:mapleader = ','

set history=1000
set textwidth=120

" Tab control
set expandtab " insert tabs rather than spaces for <Tab>
set smarttab " tab respects 'tabstop', 'shiftwidth', and 'softtabstop'
set tabstop=4 " the visible width of tabs
set softtabstop=4 " edit as if the tabs are 4 characters wide
set shiftwidth=4 " number of spaces to use for indent and unindent
set shiftround " round indent to a multiple of 'shiftwidth'
set completeopt+=longest
set clipboard=unnamed

" faster redrawing
set ttyfast

set diffopt+=vertical

" highlight conflicts
match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$'

set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp

set laststatus=2 " show the satus line all the time

" }}}

" Section AutoGroups {{{
" file type specific settings
" augroup " configgroup
    " autocmd!

    " " automatically resize panes on resize
    " autocmd VimResized * exe 'normal! \<c-w>='
    " autocmd BufWritePost .vimrc source %
    " autocmd BufWritePost .vimrc.local source %
    " " save all files on focus lost, ignoring warnings about untitled buffers
    " autocmd FocusLost * silent! wa

    " " autocmd BufNewFile,BufRead *.ejs set filetype=html
    " " autocmd BufNewFile,BufRead *.ino set filetype=c
    " " autocmd BufNewFile,BufRead *.svg set filetype=xml
    " " autocmd BufNewFile,BufRead .babelrc set filetype=json
    " " autocmd BufNewFile,BufRead .jshintrc set filetype=json
    " " autocmd BufNewFile,BufRead .eslintrc set filetype=json

    " " make quickfix windows take all the lower section of the screen
    " " when there are multiple windows open
    " autocmd FileType qf wincmd J

    " autocmd BufNewFile,BufReadPost *.md set filetype=markdown
    " let g:markdown_fenced_languages = ['css', 'javascript', 'js=javascript', 'json=javascript', 'stylus', 'html']

    " " autocmd! BufEnter * call ApplyLocalSettings(expand('<afile>:p:h'))

    " autocmd BufNewFile,BufRead,BufWrite *.md syntax match Comment /\%^---\_.\{-}---$/

    " autocmd! BufWritePost * Neomake
"augroup " END

" }}}

" Section User Interface {{{
set encoding=utf8

" code folding settings
set foldmethod=syntax " fold based on indent
set foldnestmax=10 " deepest fold is 10 levels
set nofoldenable " don't fold by default
set foldlevel=1

set so=7 " set 7 lines to the cursors - when moving vertical
set wildmenu " enhanced command line completion
set hidden " current buffer can be put into background
set showcmd " show incomplete commands
set noshowmode " don't show which mode disabled for PowerLine
set wildmode=list:longest " complete files like a shell
set scrolloff=3 " lines of text around cursor
set shell=$SHELL
set cmdheight=1 " command bar height

set title " set terminal title

" Searching
set ignorecase " case insensitive searching
set smartcase " case-sensitive if expresson contains a capital letter
set hlsearch
set incsearch " set incremental search, like modern browsers
set nolazyredraw " don't redraw while executing macros

set magic " Set magic on, for regex

set showmatch " show matching braces
set mat=2 " how many tenths of a second to blink

" error bells
set noerrorbells
set visualbell
set t_vb=
set tm=500

" switch syntax highlighting on
syntax on
let base16colorspace=256  " Access colors present in 256 colorspace"
set t_Co=256 " Explicitly tell vim that the terminal supports 256 colors"
" execute "set background=".$BACKGROUND
" execute "colorscheme ".$THEME
set background=dark
colorscheme gruvbox

set number " show line numbers
" set relativenumber " show relative line numbers

set wrap "turn on line wrapping
set wrapmargin=8 " wrap lines when coming within n characters from side
set linebreak " set soft wrapping
" set showbreak=… " show ellipsis at breaking

set autoindent " automatically set indent of new line
set smartindent

" }}}

" Section Mappings {{{

" remap esc
inoremap jk <esc>

" markdown to html
nmap <leader>md :%!markdown --html4tags <cr>

" remove extra whitespace
nmap <leader><space> :%s/\s\+$<cr>

" wipout buffer
nmap <silent> <leader>b :bw<cr>

" shortcut to save
nmap <leader>, :w<cr>

" disable Ex mode
noremap Q <NOP>

" set paste toggle
set pastetoggle=<F6>

" toggle paste mode
map <leader>v :set paste!<cr>

" toggle nerdtree
map <leader>nt :NERDTreeToggle<CR>

" Clear search
map <leader>/ :noh<CR>

" edit ~/.config/nvim/init.vim
map <leader>ev :e! ~/.config/nvim/init.vim<cr>
" edit gitconfig
map <leader>eg :e! ~/.gitconfig<cr>

" clear highlighted search
noremap <space> :set hlsearch! hlsearch?<cr>

" switch between current and last buffer
nmap <leader>. <c-^>

" enable . command in visual mode
vnoremap . :normal .<cr>

" toggle cursor line
nnoremap <leader>i :set cursorline!<cr>

" scroll the viewport faster
nnoremap <C-e> 3<C-e>
nnoremap <C-y> 3<C-y>

" }}}

" Section Functions {{{
" smart tab completion
function! Smart_TabComplete()
    let line = getline('.')                         " current line

    let substr = strpart(line, -1, col('.')+1)      " from the start of the current
    " line to one character right
    " of the cursor
    let substr = matchstr(substr, '[^ \t]*$')       " word till cursor
    if (strlen(substr)==0)                          " nothing to match on empty string
        return '\<tab>'
    endif
    let has_period = match(substr, '\.') != -1      " position of period, if any
    let has_slash = match(substr, '\/') != -1       " position of slash, if any
    if (!has_period && !has_slash)
        return '\<C-X>\<C-P>'                         " existing text matching
    elseif ( has_slash )
        return '\<C-X>\<C-F>'                         " file matching
    else
        return '\<C-X>\<C-O>'                         " plugin matching
    endif
endfunction

function! HtmlUnEscape()
  silent s/&lt;/</eg
  silent s/&gt;/>/eg
  silent s/&amp;/\&/eg
endfunction

nnoremap <silent> <leader>u :call HtmlUnEscape()<cr>

" }}}

" Section Plugins {{{

" close NERDTree after a file is opened
let g:NERDTreeQuitOnOpen=0
" show hidden files in NERDTree
let NERDTreeShowHidden=1
" remove some files by extension
let NERDTreeIgnore = ['\.js.map$']

let g:ctrlp_map='<leader>t'
let g:ctrlp_dotfiles=1
let g:ctrlp_working_path_mode = 'ra'

let g:neomake_javascript_jshint_maker = {
    \ 'args': ['--verbose'],
    \ 'errorformat': '%A%f: line %l\, col %v\, %m \(%t%*\d\)',
\ }

autocmd FileType javascript let g:neomake_javascript_enabled_makers = findfile('.jshintrc', '.;') != '' ? ['jshint'] : []

let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']

" search the nearest ancestor that contains .git, .hg, .svn
let g:ctrlp_working_path_mode = 2

" airline options
let g:airline_powerline_fonts=1
let g:airline_left_sep=''
let g:airline_right_sep=''
let g:airline_theme='base16'

" vim:foldmethod=marker:foldlevel=0
