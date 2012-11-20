" ------------------------------------------------------------------------------
" GENERAL SETTINGS
" ------------------------------------------------------------------------------

	setlocal noexpandtab                             " Tabs are not spaces
	setlocal tabstop=2                               " Tabtop
	setlocal shiftwidth=2                            " Shiftwidth
	setlocal omnifunc=javascriptcomplete#CompleteJS  " Enable autocomplete

" ------------------------------------------------------------------------------
" AUTO COMMANDS
" ------------------------------------------------------------------------------

	autocmd BufEnter,InsertLeave <buffer> 2match Error /,\_s*[)}]/
