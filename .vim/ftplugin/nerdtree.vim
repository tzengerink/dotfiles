" ------------------------------------------------------------------------------
" NERDTREE
" ------------------------------------------------------------------------------
function! s:NERDJump(search)
	:exe '/\(+\|-\)'.a:search
endfunction
command! -nargs=1 NERDJump call s:NERDJump(<f-args>)
map n :NERDJump<SPACE>
