
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
