" ------------------------------------------------------------------------------
" NERDTREE
" ------------------------------------------------------------------------------
" Quick jump to first item starting with X
function! s:NERDJump(search)
	:silent! :exe '/\c\(\~\|+\|-\)'.a:search
endfunction
command! -nargs=1 NERDJump call s:NERDJump(<f-args>)
map <buffer> na :NERDJump a<CR>
map <buffer> nb :NERDJump b<CR>
map <buffer> nc :NERDJump c<CR>
map <buffer> nd :NERDJump d<CR>
map <buffer> ne :NERDJump e<CR>
map <buffer> nf :NERDJump f<CR>
map <buffer> ng :NERDJump g<CR>
map <buffer> nh :NERDJump h<CR>
map <buffer> ni :NERDJump i<CR>
map <buffer> nj :NERDJump j<CR>
map <buffer> nk :NERDJump k<CR>
map <buffer> nl :NERDJump l<CR>
map <buffer> nm :NERDJump m<CR>
map <buffer> nn :NERDJump n<CR>
map <buffer> no :NERDJump o<CR>
map <buffer> np :NERDJump p<CR>
map <buffer> nq :NERDJump q<CR>
map <buffer> nr :NERDJump r<CR>
map <buffer> ns :NERDJump s<CR>
map <buffer> nt :NERDJump t<CR>
map <buffer> nu :NERDJump u<CR>
map <buffer> nv :NERDJump v<CR>
map <buffer> nw :NERDJump w<CR>
map <buffer> nx :NERDJump x<CR>
map <buffer> ny :NERDJump y<CR>
map <buffer> nz :NERDJump z<CR>
