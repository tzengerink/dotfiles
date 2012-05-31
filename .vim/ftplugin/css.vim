" ------------------------------------------------------------------------------
" CSS
" ------------------------------------------------------------------------------
set noexpandtab                       " Tabs are not spaces
set omnifunc=csscomplete#CompleteCSS  " Enable autocomplete
set shiftwidth=2                      " Shift width
set tabstop=2                         " Tab stop
match OverLength /\%81v.\+/           " Set OverLength at character 81

" Highlight invalid style, examples:
" 0px <=> 0
" 0.9 <=> .9
autocmd BufEnter,InsertEnter,InsertLeave *
	\ 3match InvalidStyle /\(:\s*0\(px\|\.\d\+\)\|\s0px\|\s0\.\d\+\)/
