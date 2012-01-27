" ------------------------------------------------------------------------------
" VISUAL SETTINGS
" ------------------------------------------------------------------------------
set autoindent                  " Autoindenting
set cindent                     " Use auto C-indenting
set laststatus=2                " Always show the StatusLine
set nocompatible                " Filetype detection works better this way
set nohidden                    " Closing tabs / windows also closes buffer
set nonumber                    " No line numbers
set nowrap                      " Do not wrap lines
set ruler                       " Position info
set shiftwidth=2                " Shift width
set showcmd                     " Show command in StatusLine
set tabstop=2                   " Tab stop
set wildmode=longest,list,full  " Bash like path completion

" Other cursor shape if in insert mode
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

" Different settings for active window
setlocal number
autocmd BufEnter * setlocal number
autocmd BufLeave * setlocal nonumber
autocmd BufEnter * setlocal cursorline
autocmd BufLeave * setlocal nocursorline

" ------------------------------------------------------------------------------
" SEARCH SETTINGS
" ------------------------------------------------------------------------------
set ignorecase  " Search is case insensitive
set hlsearch    " Highlight Search
set incsearch   " Incremental Search

" ------------------------------------------------------------------------------
" BACKUP SETTINGS
" ------------------------------------------------------------------------------
set backup                   " Turn on backup
set backupdir=~/.vim/backup  " Where to put the backup files
set directory=~/.vim/swap    " Where to put the swap files

" ------------------------------------------------------------------------------
" SYNTAX SETTINGS
" ------------------------------------------------------------------------------
syntax on              " Turn on syntax highlighting
filetype on            " Turn on filetype detection
" filetype plugin on   " Causes errors in filetype detection

" Color(scheme)
if (&t_Co == 256)
	set t_Co=256         " Turn on 256-colors
	set background=dark  " Terminal has dark background
	colors molokai       " Use molokai color scheme
else
	highlight Comment ctermfg=lightgrey
endif

" Overlength
highlight OverLength ctermbg=red ctermfg=white

" ------------------------------------------------------------------------------
" FILETYPE SETTINGS
" ------------------------------------------------------------------------------
" PHP
autocmd FileType php
	\ match OverLength /\%81v.\+/

" Python
autocmd FileType python
	\ set tabstop=4 |
	\ set shiftwidth=4 |
	\ set expandtab |
	\ match OverLength /\%81v.\+/

" Markdown
augroup markdown
	autocmd!
	autocmd BufNewFile,BufRead *.markdown, *.mkdn, *.mdown, *.md, *.mkd
		\ set filetype=markdown
	autocmd FileType markdown
		\ set tabstop=4 |
		\ set shiftwidth=4 |
		\ set expandtab
augroup END

" Plist
autocmd BufNewFile,BufRead *.plist
	\ set filetype=xml

" ------------------------------------------------------------------------------
" STATUS LINE
" ------------------------------------------------------------------------------
set statusline=%t                                  " Tail of the filename
set statusline+=\ [%{strlen(&fenc)?&fenc:'none'},  " File encoding
set statusline+=%{&ff}]                            " File format
set statusline+=\ %y                               " Filetype
set statusline+=\ %m                               " Modified flag
set statusline+=\ %r                               " Read only flag
set statusline+=%=                                 " Left/right separator
set statusline+=\ %c,                              " Cursor column
set statusline+=\ %l/%L                            " Cursor line/total lines
set statusline+=\ %P                               " Percent through file

" ------------------------------------------------------------------------------
" PLUGIN SETTINGS
" ------------------------------------------------------------------------------
" NERDTree
map <C-n> :NERDTreeToggle<CR>

" ZenCoding
let g:user_zen_leader_key     = '<C-y>'
let g:user_zen_expandabbr_key = '<C-e>'

" ------------------------------------------------------------------------------
" KEY MAPPINGS
" ------------------------------------------------------------------------------
" Quick save / Quick command line access
map <leader>s :update<CR>
map ; :

" Toggle line numbers / cursorline / wrap
map <leader>R :set number! number?<CR>
map <leader>C :set cursorline! cursorline?<CR>
map <leader>W :set wrap! wrap?<CR>

" Toggle search highlight
map <leader>h :noh<CR>

" Folding / Unfolding
map <leader>f :set foldmethod=indent<CR>zM<CR>
map <leader>F :set foldmethod=manual<CR>zR<CR>

" Tabs
map <C-h> :tabp<CR>
map <C-l> :tabn<CR>
map <C-t> :tabnew<CR>

" Adjust horizontal / vertical split size
map = <C-W>+
map - <C-W>-
map _ <C-W><
map + <C-W>>

" Copy clipboard support
vmap <C-c> !pbcopy<CR>:undo<CR>

" Edit & reload .vimrc
map <leader>v :e $MYVIMRC<CR>
map <leader>V :exec 'tabdo windo source $MYVIMRC'<CR>
