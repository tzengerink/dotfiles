" ------------------------------------------------------------------------------
" CSS
" ------------------------------------------------------------------------------
set noexpandtab                       " Tabs are not spaces
set omnifunc=csscomplete#CompleteCSS  " Enable autocomplete
set shiftwidth=2                      " Shift width
set tabstop=2                         " Tab stop
match OverLength /\%81v.\+/           " Set OverLength at character 81

" Highlight invalid style, examples:
" #ffffff => #fff
" 0px     => 0
" 0.9     => .9
autocmd BufEnter,BufLeave,InsertEnter,InsertLeave *
	\	2match InvalidStyle /\(#\([a-f0-9]\)\2\{5}\|:\s*0\(px\|\.\d\+\)\|\s0px\|\s0\.\d\+\)/
