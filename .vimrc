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
" SEARCH & BACKUP SETTINGS
" ------------------------------------------------------------------------------
set ignorecase               " Search is case insensitive
set hlsearch                 " Highlight Search
set incsearch                " Incremental Search
set backup                   " Turn on backup
set backupdir=~/.vim/backup  " Where to put the backup files
set directory=~/.vim/swap    " Where to put the swap files

" ------------------------------------------------------------------------------
" STATUS LINE
" ------------------------------------------------------------------------------
set statusline=%F                                  " Filename and path
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
" SYNTAX SETTINGS
" ------------------------------------------------------------------------------
syntax on           " Turn on syntax highlighting
filetype on         " Turn on filetype detection
filetype plugin on  " Causes errors in filetype detection

" Color(scheme)
if (&t_Co == 256)
	set t_Co=256         " Turn on 256-colors
	set background=dark  " Terminal has dark background
	colors solarized     " Use solarized color scheme
else
	highlight Comment ctermfg=lightgrey
endif

" Overlength
highlight OverLength ctermbg=red ctermfg=white

" ------------------------------------------------------------------------------
" SET FILETYPES
" ------------------------------------------------------------------------------
autocmd BufNewFile,BufRead *.css
	\ set filetype=css
autocmd BufNewFile,BufRead *.html,*.htm
	\ set filetype=html
autocmd BufNewFile,BufRead *.markdown,*.mkdn,*.mdown,*.md,*.mkd
	\ set filetype=markdown
autocmd BufNewFile,BufRead *.mustache
	\ set filetype=mustache
autocmd BufNewFile,BufRead *.plist
	\ set filetype=xml

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
" Quick command line access
map ; :

" Toggle stuff
map <leader>C :set cursorline! cursorline?<CR>
map <leader>H :noh<CR>
map <leader>R :set number! number?<CR>
map <leader>W :set wrap! wrap?<CR>

" Toggle OverLength
let s:overLengthIsVisible = 1
fun! ToggleOverLength()
	if (s:overLengthIsVisible)
		let s:overLengthIsVisible = 0
		return "set background=dark | colors ".g:colors_name
	else
		let s:overLengthIsVisible = 1
		return "highlight OverLength ctermbg=red ctermfg=white"
	endif
endf
map <leader>O :exe ToggleOverLength()<CR>

" Folding / Unfolding
map <leader>f :set foldmethod=indent<CR>zM<CR>
map <leader>F :set foldmethod=manual<CR>zR<CR>

" Tabs
map <C-h> :tabp<CR>
map <C-l> :tabn<CR>
map <C-t> :tabnew<CR>

" Window size adjustments
map = <C-W>+
map - <C-W>-
map _ <C-W><
map + <C-W>>
map <leader>\ :vertical resize 85<CR>

" Copy to clipboard / Remove leading whitespace
vmap <C-c> !pbcopy<CR>:undo<CR>
map <leader><< :%s/^\s\+//g<CR>:noh<CR>

" Edit & reload .vimrc
map <leader>v :e $MYVIMRC<CR>
map <leader>V :exec 'tabdo windo source $MYVIMRC'<CR>:noh<CR>
