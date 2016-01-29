set encoding=utf-8
scriptencoding utf-8

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

" highlight cursor
set cursorcolumn
set cursorline

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
set wrap
set linebreak
set nolist
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
set foldcolumn=3

" set lz

set listchars=tab:▸·,nbsp:␣,extends:…,precedes:«,extends:»,trail:·,eol:¬

" Show  tab characters. Visual Whitespace.
set list

set ffs=unix,dos,mac
set fencs=utf-8,cp1251,koi8-r,ucs-2,cp866

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = ","
let g:mapleader = ","

set colorcolumn=80

" Fast saving
nmap <leader>w :w!<cr>

:set numberwidth=4

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
    set guioptions-=m
    set guioptions-=L
    set guioptions-=r
    set guioptions-=b
    set guitablabel=%M\ %t
    set guifont=Menlo:h12
endif

set t_Co=256

syntax enable

set background=dark

" colorscheme lucius

" Enable if vim don't colorize
colorscheme hybrid

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

set softtabstop=3               " when hitting tab or backspace, how many spaces 
set mousehide
set laststatus=2 

" Make tab in v mode work like I think it should (keep highlighting):
"vmap <tab> >gv
"vmap <s-tab> <gv

nmap <c-h> :tabprevious<cr>
nmap <c-l> :tabnext<cr>
nmap <c-n> :tabnew<cr>

nmap <F4> :NERDTreeToggle<cr>
inoremap <F4> <Esc>:NERDTreeToggle<cr>

" zen-coding
"map <leader>m <c-y>,
let g:user_emmet_expandabbr_key='<c-\>'
let g:user_emmet_mode='i'
" zen-coding

"NERDTree options {{{ 
let NERDTreeIgnore          =   ['\.pyc$','\.swp$']                 "ignore compiled python files
let NERDTreeMouseMode       =   3                                   "single-click to open files/nodes
let NERDTreeWinPos          =   'left'
let NERDTreeSplitVertical   =   1                                   "and open as vsplit
let NERDTreeChDirMode       =   2                                   "change working dir when I change root
let NERDTreeShowBookmarks   =   0
"}}}


" let NERDSpaceDelims = 1

"UltiSnips
let g:UltiSnipsUsePythonVersion = 2
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

execute pathogen#infect()

" Settings for python-mode
" cd ~/.vim/bundle
" git clone https://github.com/klen/python-mode
let g:pymode = 1
let g:pymode_warnings = 0
let g:pymode_rope_goto_definition_cmd = "e"
let g:pymode_lint = 1
let g:pymode_lint_on_write = 1
let g:pymode_run_bind = '<leader>R'
let g:ropevim_autoimport_modules = ["os", "json", "logging", "django", "shutil"]
"map <Leader>b Oimport ipdb; ipdb.set_trace() # BREAKPOINT<C-c>

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

" filetypes
au BufReadPost *.tpl set syntax=smarty
au BufReadPost *.tpl.html set syntax=smarty

"ctags
nmap <leader>] [I:let nr = input("Which one: ")<Bar>exe "normal " . nr ."[\t"<CR>
nnoremap <silent><Leader><C-]> <C-w><C-]><C-w>T

nmap ]c <Plug>GitGutterNextHunk
nmap [c <Plug>GitGutterPrevHunk
let g:gitgutter_realtime = 0
let g:gitgutter_eager = 0

"vim-airline
let g:airline_theme='bubblegum'

 "unicode symbols
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'

autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
let g:acp_enableAtStartup = 0
let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_enable_ignore_case = 0
let g:neocomplcache_enable_auto_select = 1

let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

let b:surround_{char2nr("v")} = "{{ \r }}"
let b:surround_{char2nr("{")} = "{{ \r }}"
let b:surround_{char2nr("%")} = "{% \r %}"
let b:surround_{char2nr("b")} = "{% block \1block name: \1 %}\r{% endblock \1\1 %}"
let b:surround_{char2nr("i")} = "{% if \1condition: \1 %}\r{% endif %}"
let b:surround_{char2nr("w")} = "{% with \1with: \1 %}\r{% endwith %}"
let b:surround_{char2nr("f")} = "{% for \1for loop: \1 %}\r{% endfor %}"
let b:surround_{char2nr("c")} = "{% comment %}\r{% endcomment %}"
