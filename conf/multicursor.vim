let g:multi_cursor_start_word_key='<C-f>'
let g:multi_cursor_next_key='<C-f>'
let g:multi_cursor_prev_key='<C-p>'
let g:multi_cursor_skip_key='<C-s>'
let g:multi_cursor_quit_key='<Esc>'

func g:Multiple_cursors_before()
    ALEToggle
    call deoplete#custom#buffer_option('auto_complete', v:false)
endfunc
func g:Multiple_cursors_after()
    ALEToggle
    call deoplete#custom#buffer_option('auto_complete', v:true)
endfunc
