" ------------------------------------------------------------------------------
" GENERAL SETTINGS
" ------------------------------------------------------------------------------

	setlocal noexpandtab                       " Tabs are not spaces
	setlocal omnifunc=csscomplete#CompleteCSS  " Enable autocomplete
	setlocal shiftwidth=2                      " Shift width
	setlocal tabstop=2                         " Tab stop

" ------------------------------------------------------------------------------
" FOLDING OPTIONS
" ------------------------------------------------------------------------------

	setlocal fillchars=fold:-
	setlocal foldlevel=0
	setlocal foldmarker={,}
	setlocal foldmethod=marker
	setlocal foldminlines=2
	setlocal foldtext=CssFoldText()

" ------------------------------------------------------------------------------
" FUNCTIONS
" ------------------------------------------------------------------------------

	" Nicely fold the CSS statements
	function! CssFoldText()
			let line = getline(v:foldstart)
			let nnum = nextnonblank(v:foldstart + 1)
			while nnum < v:foldend+1
					let line = line . " " . substitute(getline(nnum), '\s*\(\p\+:\)\s*\(\p\+\)', '\1\2', 'g')
					let nnum = nnum + 1
			endwhile
			return line . " "
	endfunction
