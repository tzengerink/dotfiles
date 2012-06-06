" ------------------------------------------------------------------------------
" PHP
" ------------------------------------------------------------------------------
set noexpandtab                       " Tabs are not spaces
set omnifunc=phpcomplete#CompletePHP  " Enable autocomplete
"
" Highlight invalid style:
" - Do not use && and ||
" - Booleans must be in uppercase
autocmd BufEnter,BufLeave,InsertEnter,InsertLeave *
	\ 2match InvalidStyle /\(&&\|||\|\C[fF]alse\|\C[Tt]rue\)/
