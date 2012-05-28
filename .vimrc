" ------------------------------------------------------------------------------
" GENERAL SETTINGS
" ------------------------------------------------------------------------------
set autoindent                   " Autoindenting
set completeopt=longest,menuone  " Show menu and preview window
set cindent                      " Use auto C-indenting
set esckeys                      " Map missed escape sequeces (enables keypad)
set laststatus=2                 " Always show the StatusLine
set matchtime=2                  " Show matching bracket for .X seconds
set matchpairs+=<:>              " Add HTML brackets to matching pairs
set nocompatible                 " Filetype detection works better this way
set nocursorline                 " No cursorline by default
set nohidden                     " Closing tabs / windows also closes buffer
set nonumber                     " No line numbers
set nowrap                       " Do not wrap lines
set nopaste                      " Do not disable autoindent etc. when pasting
set ruler                        " Position info
set scrolloff=5                  " Keep a margin of X lines when scrolling
set shiftwidth=2                 " Shift width
set showcmd                      " Show command in StatusLine
set showmatch                    " Show matching brackets
set tabstop=2                    " Tab stop
set wildmode=longest,list,full   " Bash like path completion
set wildignore=.svn,*.pyc        " Ignore files in wildmode

" ------------------------------------------------------------------------------
" SEARCH & BACKUP SETTINGS
" ------------------------------------------------------------------------------
set hlsearch                 " Highlight Search
set incsearch                " Incremental Search
set smartcase                " Search using smart case
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
	map <leader>C :colors solarized<CR>
else
	highlight Comment ctermfg=lightgrey
endif

" Highlight Invalid Style
highlight InvalidStyle ctermbg=red ctermfg=lightred

" ------------------------------------------------------------------------------
" AUTO COMMANDS
" ------------------------------------------------------------------------------

" Toggle cursorline when entering/leaving insert mode
autocmd InsertEnter,InsertLeave * set cursorline!

" Different settings for active window
setlocal number
autocmd BufEnter * setlocal number
autocmd BufLeave * setlocal nonumber

" Highlight inline tabs as invalid style
autocmd BufEnter,BufLeave,InsertEnter,InsertLeave *
	\ match InvalidStyle /[^\t]\zs\t\+/

" Check for trailing whitespaces / remove them when saving
autocmd BufWritePre * :%s/\s\+$//e

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

" OmniComplete
imap <C-o> <C-x><C-o>

" ZenCoding
let g:user_zen_leader_key     = '<C-y>'
let g:user_zen_expandabbr_key = '<C-e>'

" ------------------------------------------------------------------------------
" KEY MAPPINGS
" ------------------------------------------------------------------------------
" Quick command line access
noremap ; :
noremap :: ;

" Save/Quit mappings
map <leader>s :w<CR>
map <leader>wa :wa<CR>
map <leader>wq :wq<CR>
map <leader>qa :qa<CR>
map <leader>WW :%!sudo tee > /dev/null %<CR>

" Toggle stuff
map <leader>H :noh<CR>
map <leader>N :set wrap! wrap?<CR>
map <leader>P :set paste! paste?<CR>
map <leader>R :set number! number?<CR>

" Toggle InvalidStyle
let s:invalidStyleIsVisible = 1
fun! ToggleInvalidStyle()
	if (s:invalidStyleIsVisible)
		let s:invalidStyleIsVisible = 0
		return "set background=dark | colors ".g:colors_name
	else
		let s:invalidStyleIsVisible = 1
		return "highlight InvalidStyle ctermbg=red ctermfg=white"
	endif
endf
map <leader>I :exe ToggleInvalidStyle()<CR>

" Folding / Unfolding
map <leader>f :set foldmethod=indent<CR>zM<CR>
map <leader>F :set foldmethod=manual<CR>zR<CR>

" Tabs / Buffers / Changelist
map <C-h>   :tabp<CR>
map <C-l>   :tabn<CR>
map <C-t>   :tabnew<CR>
map <right> :bnext<CR>
map <left>  :bprevious<CR>
map <up>    g;<CR>
map <down>  g,<CR>

" Window size adjustments
map = <C-W>+
map - <C-W>-
map _ <C-W><
map + <C-W>>
map <leader>\ :vertical resize 85<CR>

" Sessions
nmap SS :wa<CR>:mksession! ~/.vim/sessions/default
nmap SO :wa<CR>:so ~/.vim/sessions/default

" Copy to clipboard / Remove leading whitespace
vmap <C-c> !pbcopy<CR>:undo<CR>
map <leader><< :%s/^\s\+//g<CR>:noh<CR>

" Edit & reload .vimrc
map <leader>v :e $MYVIMRC<CR>
map <leader>V :exec 'tabdo windo source $MYVIMRC'<CR>:noh<CR>
