" ------------------------------------------------------------------------------
" GENERAL SETTINGS
" ------------------------------------------------------------------------------

	setlocal expandtab                " Tabs are spaces
	setlocal shiftwidth=4             " Shift width
	setlocal tabstop=4                " Tab stop

" ------------------------------------------------------------------------------
" FOLDING SETTINGS
" ------------------------------------------------------------------------------

	setlocal foldlevel=0

" ------------------------------------------------------------------------------
" AUTO COMMANDS
" ------------------------------------------------------------------------------

	" Highlight invalid style, example:
	" - Over 80 character in a single line
	autocmd BufEnter,BufLeave,InsertEnter,InsertLeave *
		\ 2match InvalidStyle /\%81v.\+/
