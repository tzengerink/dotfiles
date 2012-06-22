" ------------------------------------------------------------------------------
" PYTHON
" ------------------------------------------------------------------------------
set expandtab                " Tabs are spaces
set shiftwidth=4             " Shift width
set tabstop=4                " Tab stop

" Highlight invalid style, example:
" - Over 80 character in a single line
autocmd BufEnter,BufLeave,InsertEnter,InsertLeave *
	\ 2match InvalidStyle /\%81v.\+/
