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
set tabstop=4
set shiftwidth=2
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

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" Add a bit extra margin to the left
" set foldcolumn=3

" set lz

set listchars=tab:▸·,extends:…,precedes:«,extends:»,trail:·,eol:¬

let &showbreak = '↳ '

" Show  tab characters. Visual Whitespace.
set list

set ffs=unix,dos,mac
set fencs=utf-8,cp1251,koi8-r,ucs-2,cp866

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = ","
let g:mapleader = ","

" Fast saving
nmap <leader>w :wa!<cr>

:set numberwidth=4

nmap <leader>6 :diffget LO<cr>
nmap <leader>7 :diffget BA<cr>
nmap <leader>8 :diffget RE<cr>

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
" Set extra options when running in GUI mode
if has("gui_running")
  set guioptions-=T
  set guioptions-=e
  set guioptions-=m
  set guioptions-=L
  set guioptions-=r
  set guioptions-=b
  set guitablabel=%M\ %t
  " set guifont=Menlo:h14
  set guifont=Sauce\ Code\ Pro\ Nerd\ Font\ Complete:h14
  set background=light
  colorscheme solarized
else
  set background=dark
  colorscheme lucius
  let g:airline_symbols.crypt = '🔒'
  let g:airline_symbols.linenr = '␊'
  let g:airline_symbols.branch = '⎇'
  let g:airline_symbols.paste = 'ρ'
  let g:airline_symbols.spell = 'Ꞩ'
  let g:airline_symbols.whitespace = 'Ξ'
endif

set ambiwidth="double"

set t_Co=256

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
set wildignore=*.o,*~,*.pyc,node_modules,venv
if has("win16") || has("win32")
    set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
else
    set wildignore+=.git\*,.hg\*,.svn\*
endif

set softtabstop=3
set mousehide
set laststatus=2

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

set updatetime=250

" zen-coding
"map <leader>m <c-y>,
let g:user_emmet_expandabbr_key='<c-\>'
let g:user_emmet_mode='i'
" zen-coding

"NERDTree options {{{
nmap <F4> :NERDTreeToggle<cr>
inoremap <F4> <Esc>:NERDTreeToggle<cr>

nmap <F5> :NERDTreeFind<cr>
inoremap <F5> <Esc>:NERDTreeFind<cr>

let NERDTreeIgnore          =   ['\.pyc$','\.swp$']                 "ignore compiled python files
let NERDTreeMouseMode       =   3                                   "single-click to open files/nodes
let NERDTreeWinPos          =   'left'
let NERDTreeSplitVertical   =   1                                   "and open as vsplit
let NERDTreeChDirMode       =   2                                   "change working dir when I change root
let NERDTreeShowBookmarks   =   0
let NERDSpaceDelims = 1
"}}}


" Enable snipMate compatibility feature.
let g:neosnippet#enable_snipmate_compatibility = 1

" Tell Neosnippet about the other snippets
let g:neosnippet#snippets_directory='~/.vim/bundle/vim-snippets/snippets'

execute pathogen#infect()

" Settings for python-mode
" let g:pymode_python = 'python3'
let g:pymode_lint_ignore = "C901"
let g:pymode_rope_goto_definition_cmd = 'vnew'

let g:pymode_virtualenv_path = 'venv'
let g:pymode_run_bind = '<leader>R'
let g:pymode_rope_goto_definition_bind = '<leader>g'
let g:pymode_doc_bind = '<leader>d'
let g:pymode_rope_autoimport_bind = '<leader>ra'
let g:pymode_rope_organize_imports_bind = '<leader>ro'
let g:pymode_lint_checkers = ['pyflakes', 'pep8', 'mccabe', 'pyflakes']

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

"ctags
nmap <leader>] [I:let nr = input("Which one: ")<Bar>exe "normal " . nr ."[\t"<CR>
nnoremap <silent><Leader><C-]> <C-w><C-]><C-w>T

nmap ]c <Plug>GitGutterNextHunk
nmap [c <Plug>GitGutterPrevHunk

"vim-airline
let g:airline_theme='lucius'
let g:airline#extensions#tabline#enabled = 1

 "unicode symbols
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline_powerline_fonts = 1

let g:airline_mode_map = {
      \ '__' : '-',
      \ 'n'  : 'N',
      \ 'i'  : 'I',
      \ 'R'  : 'R',
      \ 'c'  : 'C',
      \ 'v'  : 'V',
      \ 'V'  : 'V',
      \ 's'  : 'S',
      \ 'S'  : 'S',
      \ }

let g:airline_inactive_collapse=1

let g:airline#extensions#tabline#show_tab_nr=1
let g:airline#extensions#tabline#show_tab_type=0
let g:airline#extensions#tabline#buffer_min_count = 2
let g:airline#extensions#tabline#buffers_label = 'b'
let g:airline#extensions#tabline#tabs_label = 't'
let g:airline#extensions#tabline#show_close_button = 0
let g:airline#extensions#tabline#tab_nr_type = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline#extensions#tabline#buffer_idx_mode = 1

let g:used_javascript_libs = 'jquery,angularjs,handlebars,react,underscore,backbone'

" easymotion
let g:EasyMotion_do_mapping = 0 " Disable default mappings
let g:EasyMotion_smartcase = 1

map <Leader>l <Plug>(easymotion-lineforward)
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
map <Leader>h <Plug>(easymotion-linebackward)

" Ack
nmap <leader>a :tab split<CR>:Ack ""<left>
nmap <leader>A :tab split<CR>:Ack <C-r><C-w><CR>

let g:jsx_ext_required = 0

autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

let g:acp_enableAtStartup = 0

let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_ignore_case = 0
let g:neocomplete#enable_auto_select = 1
let g:neocomplete#sources#syntax#min_keyword_length = 3

inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()
"inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
"inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"

" Plugin key-mappings.
imap <C-l>     <Plug>(neosnippet_expand_or_jump)
smap <C-l>     <Plug>(neosnippet_expand_or_jump)
xmap <C-l>     <Plug>(neosnippet_expand_target)
 "inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
  endif"

let b:surround_118 = "{{ \1variable: \1 }}\r" "v
let b:surround_101 = "{% \1expression: \1 %}\r" "e
let b:surround_98 = "{% block \1block name: \1 %}\r{% endblock \1\1 %}" "b
let b:surround_105 = "{% if \1condition: \1 %}\r{% endif %}" "i
let b:surround_102 = "{% for \1for loop: \1 %}\r{% endfor %}" "f
let b:surround_99 = "{% comment %}\r{% endcomment %}" "c
let b:surround_114 = "{{ _(\"\r\") }}" "r

let delimitMate_expand_space = 1
let delimitMate_expand_cr = 1

let g:javascript_plugin_flow = 1

let g:multi_cursor_next_key='<C-f>'
let g:multi_cursor_prev_key='<C-b>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<Esc>'

" map <Leader>bg :let &background = ( &background == "dark"? "light" : "dark"  )<CR>

function! g:ToggleBackground()
  if &background != 'dark'
    colorscheme gotham
    set background=dark
  else
    colorscheme solarized
    set background=light
  endif
endfunction
nnoremap <leader>bg :call g:ToggleBackground()<CR>


let g:ackprg = 'rg -S --no-heading --vimgrep'

nmap <silent> <C-s> <Plug>(jsdoc)
lef g:jsdoc_enable_es6 = 1
let g:javascript_plugin_jsdoc = 1
let g:jsdoc_access_descriptions = 2
let g:jsdoc_underscore_private = 1
let g:jsdoc_allow_input_prompt = 1
let g:jsdoc_input_description = 1

let g:syntastic_javascript_checkers = ['eslint']

let g:webdevicons_enable = 0
let g:webdevicons_enable_ctrlp = 0
let g:webdevicons_enable_nerdtree = 0
let g:webdevicons_enable_airline_tabline = 0

nmap <C-i> :CtrlPLine<CR>
let g:ctrlp_user_command = 'rg --files %s'

set relativenumber
function! NumberToggle()
  if(&relativenumber == 1)
    set nornu
  else
    set rnu
  endif
endfunc

nnoremap <leader>t :call NumberToggle()<cr>
