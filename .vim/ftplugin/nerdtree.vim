" ------------------------------------------------------------------------------
" NERDTREE
" ------------------------------------------------------------------------------
" Quick jump to first item starting with X
function! s:NERDJump(search)
	:exe '/\(+\|-\)'.a:search
endfunction
command! -nargs=1 NERDJump call s:NERDJump(<f-args>)
map <buffer> n :NERDJump<SPACE>
