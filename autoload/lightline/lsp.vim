function! lightline#lsp#ok()
  if lsp#get_server_status() == ''
    return ''
  endif

  let counts =  lsp#get_buffer_diagnostics_counts()
  let total = counts.error + counts.warning + counts.information + counts.hint
  if total == 0
    return ' OK'
  else
    return ''
  endif
endfunction

function! lightline#lsp#error()
  if lsp#get_server_status() == ''
    return ''
  endif

  let count = lsp#get_buffer_diagnostics_counts().error
  let sign = g:lsp_diagnostics_signs_error.text
  if count == 0
    return ''
  else
    return sign . count
  end
endfunction

function! lightline#lsp#warning()
  if lsp#get_server_status() == ''
    return ''
  endif

  let count = lsp#get_buffer_diagnostics_counts().warning
  let sign = g:lsp_diagnostics_signs_warning.text
  if count == 0
    return ''
  else
    return sign . count
  end
endfunction

function! lightline#lsp#information()
  if lsp#get_server_status() == ''
    return ''
  endif

  let count = lsp#get_buffer_diagnostics_counts().information
  let sign = g:lsp_diagnostics_signs_information.text
  if count == 0
    return ''
  else
    return sign . count
  end
endfunction

function! lightline#lsp#hint()
  if lsp#get_server_status() == ''
    return ''
  endif

  let count = lsp#get_buffer_diagnostics_counts().hint
  let sign = g:lsp_diagnostics_signs_hint.text
  if count == 0
    return ''
  else
    return sign . count
  end
endfunction
