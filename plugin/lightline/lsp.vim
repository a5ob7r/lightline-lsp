if exists('g:lighline#lsp#loaded')
  finish
endif
let g:lightline#lsp#loaded = 1

augroup lightline#lsp
  autocmd!
  autocmd User lsp_diagnostics_updated call lightline#update()
augroup END
