" ------------------------------------------------------------------------------
" NERDTREE
" ------------------------------------------------------------------------------
" Ignore some filetypes
let NerdTreeIgnore = ['\.pyc']
" Quick jump to first item starting with X
function! s:NERDJump(search, backwards)
	if a:backwards
		:silent! :exe '?\c\(|\|`\)\(\~\|+\|-\)'.a:search
	else
		:silent! :exe '/\c\(|\|`\)\(\~\|+\|-\)'.a:search
	end
endfunction
command! -nargs=* NERDJump call s:NERDJump(<f-args>)
" Search forwards
map <buffer> na :NERDJump a 0<CR>
map <buffer> nb :NERDJump b 0<CR>
map <buffer> nc :NERDJump c 0<CR>
map <buffer> nd :NERDJump d 0<CR>
map <buffer> ne :NERDJump e 0<CR>
map <buffer> nf :NERDJump f 0<CR>
map <buffer> ng :NERDJump g 0<CR>
map <buffer> nh :NERDJump h 0<CR>
map <buffer> ni :NERDJump i 0<CR>
map <buffer> nj :NERDJump j 0<CR>
map <buffer> nk :NERDJump k 0<CR>
map <buffer> nl :NERDJump l 0<CR>
map <buffer> nm :NERDJump m 0<CR>
map <buffer> nn :NERDJump n 0<CR>
map <buffer> no :NERDJump o 0<CR>
map <buffer> np :NERDJump p 0<CR>
map <buffer> nq :NERDJump q 0<CR>
map <buffer> nr :NERDJump r 0<CR>
map <buffer> ns :NERDJump s 0<CR>
map <buffer> nt :NERDJump t 0<CR>
map <buffer> nu :NERDJump u 0<CR>
map <buffer> nv :NERDJump v 0<CR>
map <buffer> nw :NERDJump w 0<CR>
map <buffer> nx :NERDJump x 0<CR>
map <buffer> ny :NERDJump y 0<CR>
map <buffer> nz :NERDJump z 0<CR>
" Search backwards
map <buffer> Na :NERDJump a 1<CR>
map <buffer> Nb :NERDJump b 1<CR>
map <buffer> Nc :NERDJump c 1<CR>
map <buffer> Nd :NERDJump d 1<CR>
map <buffer> Ne :NERDJump e 1<CR>
map <buffer> Nf :NERDJump f 1<CR>
map <buffer> Ng :NERDJump g 1<CR>
map <buffer> Nh :NERDJump h 1<CR>
map <buffer> Ni :NERDJump i 1<CR>
map <buffer> Nj :NERDJump j 1<CR>
map <buffer> Nk :NERDJump k 1<CR>
map <buffer> Nl :NERDJump l 1<CR>
map <buffer> Nm :NERDJump m 1<CR>
map <buffer> Nn :NERDJump n 1<CR>
map <buffer> No :NERDJump o 1<CR>
map <buffer> Np :NERDJump p 1<CR>
map <buffer> Nq :NERDJump q 1<CR>
map <buffer> Nr :NERDJump r 1<CR>
map <buffer> Ns :NERDJump s 1<CR>
map <buffer> Nt :NERDJump t 1<CR>
map <buffer> Nu :NERDJump u 1<CR>
map <buffer> Nv :NERDJump v 1<CR>
map <buffer> Nw :NERDJump w 1<CR>
map <buffer> Nx :NERDJump x 1<CR>
map <buffer> Ny :NERDJump y 1<CR>
map <buffer> Nz :NERDJump z 1<CR>
