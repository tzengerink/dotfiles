" ------------------------------------------------------------------------------
" GENERAL SETTINGS
" ------------------------------------------------------------------------------
set autoindent                   " Autoindenting
set completeopt=longest,menuone  " Show menu and preview window
set laststatus=2                 " Always show the StatusLine
set matchtime=1                  " Show matching bracket for .X seconds
set matchpairs+=<:>              " Add HTML brackets to matching pairs
set nocompatible                 " Filetype detection works better this way
set nocursorline                 " No cursorline by default
set nohidden                     " Closing tabs / windows also closes buffer
set nonumber                     " No line numbers
set nowrap                       " Do not wrap lines
set nopaste                      " Do not disable autoindent etc. when pasting
set ruler                        " Position info
set scrolloff=3                  " Keep a margin of X lines when scrolling
set shiftwidth=2                 " Shift width
set showcmd                      " Show command in StatusLine
set showmatch                    " Show matching brackets
set smartindent                  " Use smart indenting
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

" Change cursor / Toggle cursorline when entering/leaving insert mode
autocmd InsertEnter,InsertLeave * set cursorline!
let &t_SI = "\<Esc>]50;CursorShape=2\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

" ------------------------------------------------------------------------------
" AUTO COMMANDS
" ------------------------------------------------------------------------------

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
map <LEADER>s :w<CR>
map <LEADER>wa :wa<CR>
map <LEADER>wq :wq<CR>
map <LEADER>qa :qa<CR>
map <LEADER>qq :q<CR>
map <LEADER>WW :%!sudo tee > /dev/null %<CR>

" Toggle stuff
map <LEADER>H :noh<CR>
map <LEADER>N :set wrap! wrap?<CR>
map <LEADER>P :set paste! paste?<CR>
map <LEADER>R :set number! number?<CR>

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
map <LEADER>I :exe ToggleInvalidStyle()<CR>

" Enable numpad
inoremap <ESC>Oq 1
inoremap <ESC>Or 2
inoremap <ESC>Os 3
inoremap <ESC>Ot 4
inoremap <ESC>Ou 5
inoremap <ESC>Ov 6
inoremap <ESC>Ow 7
inoremap <ESC>Ox 8
inoremap <ESC>Oy 9
inoremap <ESC>Op 0
inoremap <ESC>On .
inoremap <ESC>OR *
inoremap <ESC>OQ /
inoremap <ESC>Ol +
inoremap <ESC>OS -

" Folding / Unfolding
map <LEADER>f :set foldmethod=indent<CR>zM<CR>
map <LEADER>F :set foldmethod=manual<CR>zR<CR>

" Tabs / Buffers / Changelist
map <C-h>   :tabp<CR>
map <C-l>   :tabn<CR>
map <C-t>   :tabnew<CR>
map <RIGHT> :bnext<CR>
map <LEFT>  :bprevious<CR>
map <UP>    g;<CR>
map <DOWN>  g,<CR>

" Window size adjustments
map = <C-W>+
map - <C-W>-
map _ <C-W><
map + <C-W>>
map <LEADER>\ :vertical resize 85<CR>

" New windows
nmap WH :leftabove vnew<CR>
nmap WJ :leftabove new<CR>
nmap WL :rightbelow vnew<CR>
nmap WK :rightbelow new<CR>

" Sessions
nmap SS :wa<CR>:mksession! ~/.vim/sessions/default
nmap SO :wa<CR>:so ~/.vim/sessions/default

" Copy to clipboard / Remove leading whitespace
vmap <C-c> !pbcopy<CR>:undo<CR>
map <LEADER><< :%s/^\s\+//g<CR>:noh<CR>

" Edit & reload .vimrc
map <LEADER>v :e $MYVIMRC<CR>
map <LEADER>V :exec 'tabdo windo source $MYVIMRC'<CR>:noh<CR>


