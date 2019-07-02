let g:lightline = {
      \ 'colorscheme': 'gotham',
      \  'active': {
      \    'left': [ [ 'mode', 'paste' ],
      \              [ 'githunks', 'fugitive', 'gitversion' ],
      \              [ 'filename', 'ctrlpmark' ] ],
      \    'right': [ [ 'ale' ], [ 'lineinfo' ], ['percent'],
      \               [ 'filetype', 'fileformat', 'fileencoding' ] ]
      \ },
      \  'inactive': {
      \    'left': [ ['mode'], [ 'fugitive' ], [ 'filename' ] ],
      \ },
      \  'tab': {
      \   'active': [ 'tabnum', 'filename', 'modified' ],
      \   'inactive': [ 'tabnum', 'filename', 'modified' ] },
      \ 'component': {
      \  'lineinfo': ' %3l:%-2v'
      \ },
      \ 'component_function': {
      \  'fugitive': 'LightlineFugitive',
      \  'githunks': 'LightlineGitGutterHunks',
      \  'ctrlpmark': 'CtrlPMark',
      \  'mode': 'LightlineMode',
      \  'filename': 'LightlineFilename',
      \  'ale': 'LightlineAle',
      \  'fileformat': 'LightlineFileformat',
      \  'fileencoding': 'LightlineFileencoding',
      \  'filetype': 'LightlineFiletype',
      \  'modified': 'LightlineModified',
      \  'gitversion': 'LightLineGitversion',
      \ },
      \  'separator': { 'left': '', 'right': '' },
      \  'subseparator': { 'left': '', 'right': '' },
      \  'tabline_separator': { 'left': '', 'right': '' },
      \  'tabline_subseparator': { 'left': '', 'right': '' }
      \ }

let g:lightline.mode_map = {
      \ 'n' : 'N',
      \ 'i' : 'I',
      \ 'R' : 'R',
      \ 'v' : 'V',
      \ 'V' : 'V-LINE',
      \ "\<C-v>": 'V-BLOCK',
      \ 'c' : 'C',
      \ 's' : 'S',
      \ 'S' : 'S-LINE',
      \ "\<C-s>": 'S-BLOCK',
      \ 't': 'T',
      \ }

let g:lightline.tabline = {
      \ 'left': [ [ 'tabs' ] ],
      \ 'right': [] }

function! LightlineReadonly()
  return &readonly ? '' : ''
endfunction

function! LightlineFugitive()
  try
    if expand('%:t') !~? 'Tagbar\|Gundo\|NERD' && &ft !~? 'vimfiler' && exists('*fugitive#head')
      let mark = ''  " edit here for cool mark
      let branch = fugitive#head()
      return branch !=# '' ? mark.branch : ''
    endif
  catch
  endtry
  return ''
endfunction

function! LightLineGitversion()
  let fullname = expand('%')
  let gitversion = ''
  if fullname =~? 'fugitive://.*/\.git//0/.*'
    let gitversion = 'git index'
  elseif fullname =~? 'fugitive://.*/\.git//2/.*'
    let gitversion = 'git target'
  elseif fullname =~? 'fugitive://.*/\.git//3/.*'
    let gitversion = 'git merge'
  elseif &diff == 1
    let gitversion = 'working copy'
  endif
  return gitversion
endfunction

function! CtrlPMark()
  if expand('%:t') =~ 'ControlP' && has_key(g:lightline, 'ctrlp_item')
    call lightline#link('iR'[g:lightline.ctrlp_regex])
    return lightline#concatenate([g:lightline.ctrlp_prev, g:lightline.ctrlp_item
          \ , g:lightline.ctrlp_next], 0)
  else
    return ''
  endif
endfunction

let g:ctrlp_status_func = {
      \ 'main': 'CtrlPStatusFunc_1',
      \ 'prog': 'CtrlPStatusFunc_2',
      \ }

function! LightlineMode()
  let fname = expand('%:t')
  return fname == '__Tagbar__' ? 'Tagbar' :
        \ fname == 'ControlP' ? 'CtrlP' :
        \ fname == '__Gundo__' ? 'Gundo' :
        \ fname == '__Gundo_Preview__' ? 'Gundo Preview' :
        \ fname =~ 'NERD_tree' ? 'NERDTree' :
        \ &ft == 'unite' ? 'Unite' :
        \ &ft == 'vimfiler' ? 'VimFiler' :
        \ &ft == 'vimshell' ? 'VimShell' :
        \ winwidth(0) > 60 ? lightline#mode() : ''
endfunction

function! CtrlPStatusFunc_1(focus, byfname, regex, prev, item, next, marked)
  let g:lightline.ctrlp_regex = a:regex
  let g:lightline.ctrlp_prev = a:prev
  let g:lightline.ctrlp_item = a:item
  let g:lightline.ctrlp_next = a:next
  return lightline#statusline(0)
endfunction

function! CtrlPStatusFunc_2(str)
  return lightline#statusline(0)
endfunction

function! LightlineFileformat()
  return winwidth(0) > 160 ? &fileformat : ''
endfunction

function! LightlineFiletype()
  return winwidth(0) > 160 ? (&filetype !=# '' ? &filetype : 'no ft') : ''
endfunction

function! LightlineFileencoding()
  return winwidth(0) > 160 ? (&fenc !=# '' ? &fenc : &enc) : ''
endfunction

function! LightlineModified()
  return winwidth(0) > 70 ? (&modified > 0 ? '[+]' : '') : ''
endfunction

function! LightlineAle()
  let counts = ale#statusline#Count(bufnr(''))
  let errors = counts.error > 0 ? 'E:'.counts.error : ''
  let warnings = counts.warning > 0 ? (errors !=# '' ? ' W:'.counts.warning : 'W:'.counts.warning) : ''
  return errors.warnings
endfunction

function! LightlineFilename()
  let fname = expand('%:t')
  return fname == 'ControlP' && has_key(g:lightline, 'ctrlp_item') ? g:lightline.ctrlp_item :
        \ fname == '__Tagbar__' ? g:lightline.fname :
        \ fname =~ '__Gundo\|NERD_tree' ? '' :
        \ &ft == 'vimfiler' ? vimfiler#get_status_string() :
        \ &ft == 'unite' ? unite#get_status_string() :
        \ &ft == 'vimshell' ? vimshell#get_status_string() :
        \ ('' != LightlineReadonly() ? LightlineReadonly() . ' ' : '') .
        \ ('' != fname ? (winwidth(0) > 115 ? expand('%') : expand('%:t')) : '[No Name]') .
        \ ('' != LightlineModified() ? ' ' . LightlineModified() : '')
endfunction

" function! LightlineHunks()
  " let symbols = ['+', '-', '~']
  " let [added, modified, removed] = sy#repo#get_stats()
  " let stats = [added, removed, modified]  " reorder
  " let hunkline = ''

  " for i in range(3)
    " let hunkline .= printf('%s%s ', symbols[i], stats[i])
  " endfor

  " if !empty(hunkline)
    " let hunkline = printf('%s', hunkline[:-2])
  " endif

  " return winwidth(0) > 70 ? (hunkline) : ''
" endfunction

function! LightlineGitGutterHunks()
  if ! exists('*GitGutterGetHunkSummary')
        \ || ! get(g:, 'gitgutter_enabled', 0)
        \ || winwidth('.') <= 90
    return ''
  endif
  let symbols = ['+', '~', '-']
  let hunks = GitGutterGetHunkSummary()
  let ret = []
  for i in [0, 1, 2]
    " if hunks[i] > 0
      call add(ret, symbols[i] . hunks[i])
    " endif
  endfor
  return winwidth(0) > 70 ? join(ret, ' ') : ''
endfunction

autocmd User Flags call Hoist('buffer', function('s:sy_stats_wrapper'))

let g:unite_force_overwrite_statusline = 0
let g:vimfiler_force_overwrite_statusline = 0
let g:vimshell_force_overwrite_statusline = 0
