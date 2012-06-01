" ------------------------------------------------------------------------------
" CSS
" ------------------------------------------------------------------------------
set noexpandtab                       " Tabs are not spaces
set omnifunc=csscomplete#CompleteCSS  " Enable autocomplete
set shiftwidth=2                      " Shift width
set tabstop=2                         " Tab stop

" Highlight invalid style, examples:
" - To long hexadecimal colors
" - Mentioning pixels after a zero
" - A zero in front of a dot
" - Overlength of more then 80 characters
autocmd BufEnter,BufLeave,InsertEnter,InsertLeave *
	\ 2match InvalidStyle /\(#\([a-f0-9]\)\2\{1}\([a-f0-9]\)\3\{1}\([a-f0-9]\)\4\{1}\|\(:\|,\)\s*0\(px\|\.\d\+\)\|\s0px\|\s0\.\d\+\|\%81v.\+\)/
