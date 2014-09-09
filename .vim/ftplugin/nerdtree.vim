" ------------------------------------------------------------------------------
" GENERAL SETTINGS
" ------------------------------------------------------------------------------

	" Ignore some filetypes
	let NerdTreeIgnore = ['\.pyc$']

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

" ------------------------------------------------------------------------------
" COMMANDS
" ------------------------------------------------------------------------------

	command! -nargs=* NERDJump call s:NERDJump(<f-args>)

" ------------------------------------------------------------------------------
" KEY MAPPINGS (NORMAL MODE)
" ------------------------------------------------------------------------------

	" Faster opening of directories/files
	nmap <buffer> <SPACE>   o
	nmap <buffer> <LEADER>x PX
	nmap <buffer> ..        Pko
	nmap <buffer> l         o
	nmap <buffer> h         o

	" Search forwards
	noremap <buffer> na :NERDJump a 0<CR>
	noremap <buffer> nb :NERDJump b 0<CR>
	noremap <buffer> nc :NERDJump c 0<CR>
	noremap <buffer> nd :NERDJump d 0<CR>
	noremap <buffer> ne :NERDJump e 0<CR>
	noremap <buffer> nf :NERDJump f 0<CR>
	noremap <buffer> ng :NERDJump g 0<CR>
	noremap <buffer> nh :NERDJump h 0<CR>
	noremap <buffer> ni :NERDJump i 0<CR>
	noremap <buffer> nj :NERDJump j 0<CR>
	noremap <buffer> nk :NERDJump k 0<CR>
	noremap <buffer> nl :NERDJump l 0<CR>
	noremap <buffer> nm :NERDJump m 0<CR>
	noremap <buffer> nn :NERDJump n 0<CR>
	noremap <buffer> no :NERDJump o 0<CR>
	noremap <buffer> np :NERDJump p 0<CR>
	noremap <buffer> nq :NERDJump q 0<CR>
	noremap <buffer> nr :NERDJump r 0<CR>
	noremap <buffer> ns :NERDJump s 0<CR>
	noremap <buffer> nt :NERDJump t 0<CR>
	noremap <buffer> nu :NERDJump u 0<CR>
	noremap <buffer> nv :NERDJump v 0<CR>
	noremap <buffer> nw :NERDJump w 0<CR>
	noremap <buffer> nx :NERDJump x 0<CR>
	noremap <buffer> ny :NERDJump y 0<CR>
	noremap <buffer> nz :NERDJump z 0<CR>

	" Search backwards
	noremap <buffer> Na :NERDJump a 1<CR>
	noremap <buffer> Nb :NERDJump b 1<CR>
	noremap <buffer> Nc :NERDJump c 1<CR>
	noremap <buffer> Nd :NERDJump d 1<CR>
	noremap <buffer> Ne :NERDJump e 1<CR>
	noremap <buffer> Nf :NERDJump f 1<CR>
	noremap <buffer> Ng :NERDJump g 1<CR>
	noremap <buffer> Nh :NERDJump h 1<CR>
	noremap <buffer> Ni :NERDJump i 1<CR>
	noremap <buffer> Nj :NERDJump j 1<CR>
	noremap <buffer> Nk :NERDJump k 1<CR>
	noremap <buffer> Nl :NERDJump l 1<CR>
	noremap <buffer> Nm :NERDJump m 1<CR>
	noremap <buffer> Nn :NERDJump n 1<CR>
	noremap <buffer> No :NERDJump o 1<CR>
	noremap <buffer> Np :NERDJump p 1<CR>
	noremap <buffer> Nq :NERDJump q 1<CR>
	noremap <buffer> Nr :NERDJump r 1<CR>
	noremap <buffer> Ns :NERDJump s 1<CR>
	noremap <buffer> Nt :NERDJump t 1<CR>
	noremap <buffer> Nu :NERDJump u 1<CR>
	noremap <buffer> Nv :NERDJump v 1<CR>
	noremap <buffer> Nw :NERDJump w 1<CR>
	noremap <buffer> Nx :NERDJump x 1<CR>
	noremap <buffer> Ny :NERDJump y 1<CR>
	noremap <buffer> Nz :NERDJump z 1<CR>
