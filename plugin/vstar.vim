" From http://got-ravings.blogspot.com/2008/07/vim-pr0n-visual-search-mappings.html

" makes * and # work on visual mode too.
function! s:VSetSearchNoBoundary(cmdtype)
  let temp = @s
  norm! gv"sy
  let @/ = '\V' . substitute(escape(@s, a:cmdtype.'\'), '\n', '\\n', 'g')
  let @s = temp
endfunction

function! s:VSetSearch(cmdtype)
  call s:VSetSearchNoBoundary(a:cmdtype)
  let @/ = '\<'.@/.'\>'
endfunction

xnoremap * :<C-U>call <SID>VSetSearch('/')<CR>//<CR>
xnoremap # :<C-U>call <SID>VSetSearch('?')<CR>??<CR>
xnoremap g* :<C-U>call <SID>VSetSearchNoBoundary('/')<CR>//<CR>
xnoremap g# :<C-U>call <SID>VSetSearchNoBoundary('?')<CR>??<CR>
