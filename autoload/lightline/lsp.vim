let s:ok_symbol = get(g:, 'lightline#lsp#ok_symbol', 'OK')
let s:error_symbol = get(g:, 'lightline#lsp#error_symbol', get(g:lsp_diagnostics_signs_error, 'text', 'E:'))
let s:warning_symbol = get(g:, 'lightline#lsp#warning_symbol', get(g:lsp_diagnostics_signs_warning, 'text', 'W:'))
let s:information_symbol = get(g:, 'lightline#lsp#information_symbol', get(g:lsp_diagnostics_signs_information, 'text', 'I:'))
let s:hint_symbol = get(g:, 'lightline#lsp#hint_symbol', get(g:lsp_diagnostics_signs_hint, 'text', 'H:'))

let s:error_enabled = get(g:, 'lightline#lsp#error_enabled', 1)
let s:warning_enabled = get(g:, 'lightline#lsp#warning_enabled', 1)
let s:information_enabled = get(g:, 'lightline#lsp#information_enabled', 1)
let s:hint_enabled = get(g:, 'lightline#lsp#hint_enabled', 1)

function! lightline#lsp#ok() abort
  if lsp#get_server_status() == ''
    return ''
  endif

  let l:counts =  lsp#get_buffer_diagnostics_counts()

  let l:total = 0
  if s:error_enabled
    let l:total += counts.error
  endif

  if s:warning_enabled
    let l:total += counts.warning
  endif

  if s:information_enabled
    let l:total += counts.information
  endif

  if s:hint_enabled
    let l:total += counts.hint
  endif

  if total == 0
    return s:ok_symbol
  else
    return ''
  endif
endfunction

function! lightline#lsp#error() abort
  if lsp#get_server_status() == '' || ! s:error_enabled
    return ''
  endif

  let count = lsp#get_buffer_diagnostics_counts().error
  if count == 0
    return ''
  else
    return s:error_symbol . count
  end
endfunction

function! lightline#lsp#warning() abort
  if lsp#get_server_status() == '' || ! s:warning_enabled
    return ''
  endif

  let count = lsp#get_buffer_diagnostics_counts().warning
  if count == 0
    return ''
  else
    return s:warning_symbol . count
  end
endfunction

function! lightline#lsp#information() abort
  if lsp#get_server_status() == '' || ! s:information_enabled
    return ''
  endif

  let count = lsp#get_buffer_diagnostics_counts().information
  if count == 0
    return ''
  else
    return s:information_symbol . count
  end
endfunction

function! lightline#lsp#hint() abort
  if lsp#get_server_status() == '' || ! s:hint_enabled
    return ''
  endif

  let count = lsp#get_buffer_diagnostics_counts().hint
  let sign = g:lsp_diagnostics_signs_hint.text
  if count == 0
    return ''
  else
    return s:hint_symbol . count
  end
endfunction
