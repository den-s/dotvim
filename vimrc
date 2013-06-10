set nocompatible
" Sets how many lines of history VIM has to remember
set history=700
set undolevels=700

" Enable filetype plugins
filetype plugin on
filetype indent on

" 1 tab == 4 spaces
set tabstop=4
set shiftwidth=4
set expandtab

" Be smart when using tabs ;)
set smarttab

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
set nowrap
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

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" Add a bit extra margin to the left
set foldcolumn=1

" set lz

"set listchars=tab:▸\ ,precedes:«,extends:»
set listchars=tab:\|\ ,precedes:«,extends:»

" Show  tab characters. Visual Whitespace.
set list

set ffs=unix,dos,mac
set fencs=utf-8,cp1251,koi8-r,ucs-2,cp866

 "HTML validator
"au FileType html compiler html
"au QuickFixCmdPost make cwindow

"Syntastic All validator
let g:syntastic_error_symbol='✗'
let g:syntastic_warning_symbol='⚠'
let g:syntastic_auto_loc_list=1
let g:syntastic_html_checkers=['tidy','w3']
let g:syntastic_css_checkers=['csslint','prettycss']
let g:syntastic_auto_jump=1
let g:syntastic_mode_map = { 'mode': 'active',
                           \ 'active_filetypes': [],
                           \ 'passive_filetypes': ['css', 'php', 'js', 'ruby', 'vim', 'python', 'html', 'coffee'] }

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = ","
let g:mapleader = ","

" Fast saving
nmap <leader>w :w!<cr>

" Powerline
let g:Powerline_symbols = 'fancy'

for prefix in ['n', 'v']
  for key in ['<Up>', '<Down>', '<Left>', '<Right>']
    exe prefix . "noremap " . key . " <Nop>"
  endfor
endfor

nmap <Up> <C-W><Up>
nmap <Down> <C-W><Down>
nmap <Left> <C-W><Left>
nmap <Right> <C-W><Right>

" Set extra options when running in GUI mode
if has("gui_running")
    set guioptions-=T
    set guioptions-=e
    set t_Co=256
    set guitablabel=%M\ %t
endif

if $COLORTERM == 'gnome-terminal'
    set t_Co=256
endif

syntax enable

if has('gui_running')
    set background=light
else
    set background=dark
endif

colorscheme jellybeans

" Set utf8 as standard encoding and en_US as the standard
set encoding=utf8

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
set wildignore=*.o,*~,*.pyc
if has("win16") || has("win32")
    set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
else
    set wildignore+=.git\*,.hg\*,.svn\*
endif

set softtabstop=4               " when hitting tab or backspace, how many spaces 
set mousehide
set laststatus=2 

" Make tab in v mode work like I think it should (keep highlighting):
vmap <tab> >gv
vmap <s-tab> <gv

inoremap <c-h> <Esc>:tabprevious<cr>
map <c-h> :tabprevious<cr>
inoremap <c-l> <Esc>:tabnext<cr>
map <c-l> :tabnext<cr>
map <c-n> :tabnew<cr>

map <F4> :NERDTreeToggle<cr>
inoremap <F4> <Esc>:NERDTreeToggle<cr>

map <a-left> :diffget<cr>
map <a-right> :diffput<cr>

" zen-coding
"map <leader>m <c-y>,
"inoremap <tab> <Esc><c-y>,
let g:user_zen_expandabbr_key='<c-f>'
let g:user_zen_mode='a'
" zen-coding

"Syntastic validate
map <leader>c :SyntasticCheck<CR>

" Tag list
"noremap <silent> <F8> :TlistToggle<CR>
"nnoremap <silent> <a-s-down> Yp<CR>
" /Tag list

"NERDTree options {{{ 

let NERDTreeIgnore          =   ['\.pyc$','\.swp$']                 "ignore compiled python files
let NERDTreeMouseMode       =   3                                   "single-click to open files/nodes
let NERDTreeWinPos          =   'left'
let NERDTreeSplitVertical   =   1                                   "and open as vsplit
let NERDTreeChDirMode       =   2                                   "change working dir when I change root
let NERDTreeShowBookmarks   =   0

"}}}

execute pathogen#infect()

" Settings for python-mode
" cd ~/.vim/bundle
" git clone https://github.com/klen/python-mode
map <Leader>g :call RopeGotoDefinition()<CR>
let ropevim_enable_shortcuts = 1
let g:pymode_rope_goto_def_newwin = "vnew"
let g:pymode_rope_extended_complete = 1
let g:pymode_breakpoint = 0
let g:pymode_syntax = 1
let g:pymode_syntax_builtin_objs = 0
let g:pymode_syntax_builtin_funcs = 0
map <Leader>b Oimport ipdb; ipdb.set_trace() # BREAKPOINT<C-c>

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

map <leader>f :call JsBeautify()<cr>
