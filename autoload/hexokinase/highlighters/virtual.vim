if exists('*nvim_create_namespace')
  let s:namespace = nvim_create_namespace('')
else
  echoerr 'virtual highlighting only works with Neovim v0.3.2 - please upgrade'
endif

fun! hexokinase#highlighters#virtual#highlight(lnum, hex, hl_name, start, end) abort
  if exists('*nvim_buf_set_virtual_text')
    call nvim_buf_set_virtual_text(
          \   bufnr('%'),
          \   s:namespace,
          \   a:lnum - 1,
          \   [[g:Hexokinase_virtualText, a:hl_name]],
          \   {}
          \ )
  endif
endf

fun! hexokinase#highlighters#virtual#tearDown() abort
  if exists('*nvim_buf_clear_namespace')
    call nvim_buf_clear_namespace(bufnr('%'), s:namespace, 0, -1)
  endif
endf
