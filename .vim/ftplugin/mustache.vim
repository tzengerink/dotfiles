" ------------------------------------------------------------------------------
" MUSTACH
" ------------------------------------------------------------------------------
set noexpandtab                 " Do NOT expand tabs
set shiftwidth=2                " Shift width
set tabstop=2                   " Tab stop

" Highlight invalid style, example:
" - Over 80 character in a single line
autocmd BufEnter,BufLeave,InsertEnter,InsertLeave *
	\ 2match OverLength /\%81v.\+/
