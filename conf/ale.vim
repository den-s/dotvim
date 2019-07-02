let g:ale_linters = {
\   'python': ['pylint', 'flake8'],
\   'javascript': ['eslint', 'standard'],
\   'javascript.jsx': ['eslint', 'standard'],
\}

" let g:ale_fix_on_save = 1

let g:ale_history_enabled = 0
" let g:ale_lint_on_text_changed = 'normal'
" let g:ale_lint_on_enter = 0
let g:ale_lint_delay = 300
let g:ale_linters_explicit = 1
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%severity%][%linter%] %s'

" nnoremap <leader>st :SyntasticToggleMode<CR>
map <leader>st :ALEToggle<CR>
