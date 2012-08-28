" ------------------------------------------------------------------------------
" GENERAL SETTINGS
" ------------------------------------------------------------------------------

	if has("gui_running")
		setlocal norelativenumber  " No relative numbers
	endif

	" Ignore some filetypes
	let NerdTreeIgnore = ['\.pyc']

" ------------------------------------------------------------------------------
" FUNCTIONS
" ------------------------------------------------------------------------------

	" Quick jump to first item starting with X
	function! s:NERDJump(search, backwards)
		if a:backwards
			:silent! :exe '?\c\(|\|`\)\(\~\|+\|-\)'.a:search
		else
			:silent! :exe '/\c\(|\|`\)\(\~\|+\|-\)'.a:search
		end
	endfunction
	command! -nargs=* NERDJump call s:NERDJump(<f-args>)

" ------------------------------------------------------------------------------
" KEY MAPPINGS (NORMAL MODE)
" ------------------------------------------------------------------------------

	" Faster opening of directories/files
	nmap <buffer> <SPACE>   o
	nmap <buffer> <LEADER>x PX

	" Search forwards
	nmap <buffer> na :NERDJump a 0<CR>
	nmap <buffer> nb :NERDJump b 0<CR>
	nmap <buffer> nc :NERDJump c 0<CR>
	nmap <buffer> nd :NERDJump d 0<CR>
	nmap <buffer> ne :NERDJump e 0<CR>
	nmap <buffer> nf :NERDJump f 0<CR>
	nmap <buffer> ng :NERDJump g 0<CR>
	nmap <buffer> nh :NERDJump h 0<CR>
	nmap <buffer> ni :NERDJump i 0<CR>
	nmap <buffer> nj :NERDJump j 0<CR>
	nmap <buffer> nk :NERDJump k 0<CR>
	nmap <buffer> nl :NERDJump l 0<CR>
	nmap <buffer> nm :NERDJump m 0<CR>
	nmap <buffer> nn :NERDJump n 0<CR>
	nmap <buffer> no :NERDJump o 0<CR>
	nmap <buffer> np :NERDJump p 0<CR>
	nmap <buffer> nq :NERDJump q 0<CR>
	nmap <buffer> nr :NERDJump r 0<CR>
	nmap <buffer> ns :NERDJump s 0<CR>
	nmap <buffer> nt :NERDJump t 0<CR>
	nmap <buffer> nu :NERDJump u 0<CR>
	nmap <buffer> nv :NERDJump v 0<CR>
	nmap <buffer> nw :NERDJump w 0<CR>
	nmap <buffer> nx :NERDJump x 0<CR>
	nmap <buffer> ny :NERDJump y 0<CR>
	nmap <buffer> nz :NERDJump z 0<CR>

	" Search backwards
	nmap <buffer> Na :NERDJump a 1<CR>
	nmap <buffer> Nb :NERDJump b 1<CR>
	nmap <buffer> Nc :NERDJump c 1<CR>
	nmap <buffer> Nd :NERDJump d 1<CR>
	nmap <buffer> Ne :NERDJump e 1<CR>
	nmap <buffer> Nf :NERDJump f 1<CR>
	nmap <buffer> Ng :NERDJump g 1<CR>
	nmap <buffer> Nh :NERDJump h 1<CR>
	nmap <buffer> Ni :NERDJump i 1<CR>
	nmap <buffer> Nj :NERDJump j 1<CR>
	nmap <buffer> Nk :NERDJump k 1<CR>
	nmap <buffer> Nl :NERDJump l 1<CR>
	nmap <buffer> Nm :NERDJump m 1<CR>
	nmap <buffer> Nn :NERDJump n 1<CR>
	nmap <buffer> No :NERDJump o 1<CR>
	nmap <buffer> Np :NERDJump p 1<CR>
	nmap <buffer> Nq :NERDJump q 1<CR>
	nmap <buffer> Nr :NERDJump r 1<CR>
	nmap <buffer> Ns :NERDJump s 1<CR>
	nmap <buffer> Nt :NERDJump t 1<CR>
	nmap <buffer> Nu :NERDJump u 1<CR>
	nmap <buffer> Nv :NERDJump v 1<CR>
	nmap <buffer> Nw :NERDJump w 1<CR>
	nmap <buffer> Nx :NERDJump x 1<CR>
	nmap <buffer> Ny :NERDJump y 1<CR>
	nmap <buffer> Nz :NERDJump z 1<CR>
