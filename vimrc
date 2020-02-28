set encoding=utf-8
scriptencoding utf-8

set splitbelow
set splitright

set nocompatible
" Sets how many lines of history VIM has to remember
set history=700
set undolevels=700

" Enable filetype plugins
filetype plugin on
filetype indent on

" 1 tab == 2 spaces
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab

" Be smart when using tabs ;)
" set smarttab

" Set 7 lines to the cursor - when moving vertically using j/k
set so=7

" Turn on the WiLd menu
set wildmenu

" Always show current position
set ruler

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

"set et
set wrap
set linebreak
"set nolist
set ai "Auto indent
set si "Smart indent

" Show matching brackets when text indicator is over them
set showmatch

" How many tenths of a second to blink when matching brackets
set mat=2

" Highlight search results
set hlsearch

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases
set smartcase

" Makes search act like search in modern browsers
set incsearch

set number
set fo-=t " don't automatically wrap text when typing

" Set to auto read when a file is changed from the outside
set autoread

" Don't redraw while executing macros (good performance config)
set lazyredraw

set synmaxcol=128
syntax sync minlines=256
" set foldminlines=7

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" Add a bit extra margin to the left
set foldmethod=syntax
set foldcolumn=3

nnoremap <space> za
nnoremap <s-space> zA

" set lz

set listchars=tab:▸·,extends:…,precedes:«,extends:»,trail:·,eol:¬

let &showbreak = '↳ '

" Show  tab characters. Visual Whitespace.
set list

set ffs=unix,dos,mac
set fencs=utf-8,cp1251,koi8-r,ucs-2,cp866

" Disable add a new lane at the end of the file
set nofixendofline

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = ","
let g:mapleader = ","

" Fast saving
nmap <leader>w :wa!<cr>

set numberwidth=4

nmap <leader>sr :set spell spelllang=ru_RU<cr>
nmap <leader>se :set spell spelllang=en_us<cr>
nmap <leader>ss :set spell<cr>
nmap <leader>sd :set nospell<cr>

nmap <leader>6 :diffget LOCAL<cr>
nmap <leader>7 :diffget BASE<cr>
nmap <leader>8 :diffget REMOTE<cr>

" Set extra options when running in GUI mode
if has("gui_running")
  set guioptions-=T
  set guioptions-=e
  set guioptions-=m
  set guioptions-=L
  set guioptions-=r
  set guioptions-=b
  set guitablabel=%M\ %t
  set guifont=Menlo:h14
  set macligatures
  if has('mac')
    if system("osascript -e 'tell application \"Finder\" to get bounds of window of desktop' | cut -d ' ' -f 4") > 900
      " set guifont=Sauce\ Code\ Pro\ Nerd\ Font\ Complete:h17
      set guifont=Victor\ Mono\ Medium:h17
    else
      " set guifont=Sauce\ Code\ Pro\ Nerd\ Font\ Complete:h14
      set guifont=Victor\ Mono\ Medium:h14
    endif
  endif
endif

set background=dark
colorscheme gotham

set ambiwidth="double"

" set t_Co=256
set termguicolors

syntax enable

set ttyfast

" Enable if vim don't colorize
" colorscheme hybrid
" let g:gruvbox_improved_warnings=1

" Use Unix as the standard file type
set ffs=unix,dos,mac

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"=> Files, backups and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile

runtime macros/matchit.vim

" Ignore compiled files
set wildignore=*.o,*~,*.pyc,node_modules,venv,bower_components
if has("win16") || has("win32")
    set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
else
    set wildignore+=.git\*,.hg\*,.svn\*
endif

" set mousehide
set laststatus=2

" set relativenumber

" Make tab in v mode work like I think it should (keep highlighting):
vmap <tab> >gv
vmap <s-tab> <gv

nmap <c-h> :tabprevious<cr>
nmap <c-l> :tabnext<cr>
nmap <c-n> :tabnew<cr>

nmap <Up> <C-W><Up>
nmap <Down> <C-W><Down>
nmap <Left> <C-W><Left>
nmap <Right> <C-W><Right>

set updatetime=100

" zen-coding
"map <leader>m <c-y>,
let g:user_emmet_expandabbr_key='<c-\>'
let g:user_emmet_mode='i'
" zen-coding

" Better navigating through omnicomplete option list
" See
" http://stackoverflow.com/questions/2170023/how-to-map-keys-for-popup-menu-in-vim
set completeopt=longest,menuone
function! OmniPopup(action)
    if pumvisible()
        if a:action == 'j'
            return "\<C-N>"
        elseif a:action == 'k'
            return "\<C-P>"
        endif
    endif
    return a:action
endfunction

inoremap <silent><C-j> <C-R>=OmniPopup('j')<CR>
inoremap <silent><C-k> <C-R>=OmniPopup('k')<CR>

nmap <leader>r :edit<CR>
nmap <leader>rr :syntax on<CR> :syntax sync fromstart<CR>:redraw!<CR>

function! g:ToggleBackground()
  if &background != 'dark'
    colorscheme gotham
    set background=dark
  else
    colorscheme lucius
    set background=light
  endif
endfunction
nnoremap <leader>bg :call g:ToggleBackground()<CR>

nnoremap <leader>tt2 :set tabstop=2 shiftwidth=2 expandtab<CR>
nnoremap <leader>tt4 :set tabstop=4 shiftwidth=4 expandtab<CR>

augroup vimrc
  autocmd!
  autocmd bufwritepost .vimrc source $MYVIMRC
augroup end

"ctags
nmap <leader>] [I:let nr = input("Which one: ")<Bar>exe "normal " . nr ."[\t"<CR>
nnoremap <silent><Leader><C-]> <C-w><C-]><C-w>T

" Ack
nmap <leader>a :tab split<CR>:Ack ""<left>
nmap <leader>A :tab split<CR>:Ack <C-r><C-w><CR>

" Grepper
" nmap <leader>a :tab split<CR>:GrepperRg ""<left>
" nmap <leader>A :tab split<CR>:GrepperRg <C-r><C-w><CR>

" let g:jsx_ext_required = 0

" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif

" nmap <C-i> :CtrlPLine<CR>
let g:ctrlp_user_command = 'rg --files %s'
nmap <C-b> :CtrlPBuffer<CR>

let g:ackprg = 'rg -S --no-heading --vimgrep'

let g:vrc_show_command = 1

" set pyxversion=3

call plug#begin('~/.vim/plugins')

" Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'suy/vim-context-commentstring'
Plug 'tpope/vim-repeat'
Plug 'mattn/emmet-vim'
Plug 'jonathanfilip/vim-lucius'
Plug 'tpope/vim-unimpaired'
Plug 'honza/vim-snippets'
Plug 'w0ng/vim-hybrid'
Plug 'easymotion/vim-easymotion'
Plug 'mileszs/ack.vim'
Plug 'groenewege/vim-less'
" Plug 'mxw/vim-jsx'
Plug 'diepm/vim-rest-console'
Plug 'hesselbom/vim-hsftp'
Plug 'Raimondi/delimitMate'
Plug 'whatyouhide/vim-gotham'
Plug 'pangloss/vim-javascript'
Plug 'terryma/vim-multiple-cursors'
Plug 'heavenshell/vim-jsdoc'
Plug 'tpope/vim-sleuth'
Plug 'altercation/vim-colors-solarized'
Plug 'plasticboy/vim-markdown'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'Shougo/vimproc.vim'
Plug 'hail2u/vim-css3-syntax'
Plug 'w0rp/ale'
Plug 'SirVer/ultisnips'
Plug 'junegunn/fzf', { 'do': './install --bin' }
Plug 'junegunn/fzf.vim'
Plug 'itchyny/lightline.vim'
" Plug 'airblade/vim-gitgutter'
Plug 'mhinz/vim-signify'
Plug 'vim-scripts/indentpython.vim'
Plug 'maxmellon/vim-jsx-pretty'
" Plug 'python-mode/python-mode'
Plug 'ap/vim-css-color'
" Plug 'luochen1990/rainbow'
" Plug 'mhinz/vim-grepper'
Plug 'ternjs/tern_for_vim', { 'do': 'npm install && npm install -g tern' }
Plug 'carlitux/deoplete-ternjs'
Plug 'Yggdroot/indentLine'
Plug 'deoplete-plugins/deoplete-jedi'
Plug 'tmhedberg/SimpylFold'
" if has('nvim')
  " Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
" else
  " Plug 'Shougo/deoplete.nvim'
  " Plug 'roxma/nvim-yarp'
  " Plug 'roxma/vim-hug-neovim-rpc'
" endif
" let g:deoplete#enable_at_startup = 1
"
function! BuildYCM(info)
  " info is a dictionary with 3 fields
  " - name:   name of the plugin
  " - status: 'installed', 'updated', or 'unchanged'
  " - force:  set on PlugInstall! or PlugUpdate!
  if a:info.status == 'installed' || a:info.force
    !./install.py
  endif
endfunction

Plug 'Valloric/YouCompleteMe', { 'do': function('BuildYCM') }

call plug#end()

let g:rainbow_active = 1

source ~/.vim/conf/nerdtree.vim

source ~/.vim/conf/pymode.vim

source ~/.vim/conf/gitgutter.vim

source ~/.vim/conf/easymotion.vim

source ~/.vim/conf/youcompleteme.vim

source ~/.vim/conf/surround.vim

source ~/.vim/conf/multicursor.vim

source ~/.vim/conf/vim-javascript.vim

source ~/.vim/conf/ale.vim

source ~/.vim/conf/lightline.vim

source ~/.vim/conf/signify.vim

source ~/.vim/conf/fzf.vim

source ~/.vim/conf/nerdcommenter.vim

source ~/.vim/conf/deoplete.vim

source ~/.vim/conf/delimmate.vim
