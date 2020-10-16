" ------------------------------------------------------------------------------
" VUNDLE
" ------------------------------------------------------------------------------

	set nocompatible
	filetype off

" ------------------------------------------------------------------------------
" SETTINGS
" ------------------------------------------------------------------------------

	" Cursor
	let &t_SI = "\eP\e[3 q\e\\"
	let &t_EI = "\eP\e[1 q\e\\"

	" Colorscheme
	colors green-n-blue

	" General
	set autoindent                                     " Autoindenting
	set backspace=indent,eol,start                     " Backspace functionality
	set completeopt=longest,menuone                    " Show menu and preview window
	set cursorline                                     " No cursorline by default
	set laststatus=2                                   " Always show the StatusLine
	set lazyredraw                                     " Do not redraw while running macros
	set list                                           " Show non text characters
	set listchars=eol:¬,tab:→\ ,trail:▒,nbsp:·         " Characters to use for non text
	set matchpairs+=<:>                                " Add HTML brackets to matching pairs
	set matchtime=1                                    " Show matching bracket for .X seconds
	set modeline                                       " Allow modeline comment settings
	set modelines=5                                    " Check the first 5 lines for settings
	set mouse=a
	set noerrorbells                                   " No errorbells
	set novisualbell                                   " No visualbell
	set nohidden                                       " Closing tabs / windows also closes buffer
	set number                                         " Show line numbers
	set nopaste                                        " Do not disable autoindent etc. when pasting
	set nowrap                                         " Do not wrap lines
	set ruler                                          " Position info
	set scrolloff=5                                    " Keep a margin of X lines when scrolling
	set shiftwidth=2                                   " Shift width
	set signcolumn=yes                                 " Enable the sign column
	set showcmd                                        " Show command in StatusLine
	set showmatch                                      " Show matching brackets
	set smartindent                                    " Use smart indenting
	set tabstop=2                                      " Tab stop
	set wildignore=.svn,*.pyc                          " Ignore files in wildmode
	set wildmode=longest,list,full                     " Bash like path completion

	" Folding
	set fillchars=fold:·                               " Character used as fill
	set nofoldenable                                   " (Don't) fold by default (foldenable / nofoldenable)
	set foldlevel=1                                    " Use X levels of folding
	set foldmarker={,}                                 " Set brackets as default fold marker
	set foldmethod=indent                              " Method of folding
	set foldminlines=1                                 " Do not fold when less then X lines
	set foldnestmax=2                                  " Maximum of X nested folds

	" Search
	set hlsearch                                       " Highlight Search
	set incsearch                                      " Incremental Search
	set ignorecase                                     " Ignore cases when searching ..
	set smartcase                                      " .. unless uppercase in term

	" Backup
	set noswapfile                                     " Turn of swapfiles
	set nobackup                                       " Turn off backup

	" Statusline
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
" AUTO COMMANDS
" ------------------------------------------------------------------------------

	" Repeat comments
	autocmd FileType * set formatoptions=croql
	autocmd FileType * set comments=s1:/*,mb:*,ex:*/

	" Toggle cursorline when entering/leaving insert mode
	autocmd InsertEnter * highlight CursorLine   ctermbg=232
	autocmd InsertEnter * highlight CursorLineNr ctermbg=232
	autocmd InsertLeave * highlight CursorLine   ctermbg=236
	autocmd InsertLeave * highlight CursorLineNr ctermbg=236

	" Cursorline only in active window
	augroup CursorLineOnlyInActiveWindow
		autocmd!
		autocmd VimEnter,WinEnter,BufWinEnter * setlocal cursorline
		autocmd WinLeave * setlocal nocursorline
	augroup end

	" Git commit settings
	autocmd FileType gitcommit set formatoptions+=t
	autocmd FileType gitcommit set textwidth=72
	autocmd FileType gitcommit set spell spelllang=en,nl

" ------------------------------------------------------------------------------
" KEY MAPPINGS (NORMAL MODE)
" ------------------------------------------------------------------------------

	" Quick command line access
	noremap ; :
	noremap :: ;

	" Save file as superuser
	noremap <LEADER>WW :%!sudo tee > /dev/null %<CR>

	" Toggle stuff
	noremap <LEADER>A :set wrap! wrap?<CR>
	noremap <LEADER>H :noh<CR>
	noremap <LEADER>L :set list! list?<CR>
	noremap <LEADER>N :set number! number?<CR>
	noremap <LEADER>P :set paste! paste?<CR>

	" Folding / Unfolding
	noremap <LEADER>f       zM
	noremap <LEADER>F       zR
	noremap <SPACE>         za
	noremap <LEADER><SPACE> zMzv

	" Execute macro at `q`
	nnoremap K @q

	" Tabs
	noremap <C-H> :tabp<CR>
	noremap <C-L> :tabn<CR>
	noremap <C-J> :tabnew<CR>

	" Buffers
	noremap <RIGHT>    :bnext<CR>
	noremap <LEFT>     :bprevious<CR>
	noremap <LEADER>b  :buffers<CR>:buffer<SPACE>

	" Windows
	noremap =          :vertical resize +5<CR>
	noremap -          :vertical resize -5<CR>
	noremap +          :resize +5<CR>
	noremap _          :resize -5<CR>
	noremap WH         :leftabove vnew<CR>
	noremap WJ         :rightbelow new<CR>
	noremap WL         :rightbelow vnew<CR>
	noremap WK         :leftabove new<CR>
	noremap <LEADER>\  :vertical resize 85<CR>
	noremap <LEADER>\\ <C-W>=
	noremap <LEADER>e  :bufdo e<CR>

	" Sessions
	noremap <LEADER>SS :wa<CR>:mksession! ~/.vim/sessions/default<CR>
	noremap <LEADER>SO :wa<CR>:so ~/.vim/sessions/default<CR>

	" Yank to end of line
	noremap Y y$

	" Display
	nnoremap <LEADER>d :echo strftime("%c")." [".strftime("%Y%m%d%H%M%S")."]"<CR>

	" Temporary SQL query
	noremap <LEADER>EQ :e /var/tmp/query.sql<CR>:set ft=mysql<CR>
	noremap <LEADER>XQ :ExecuteMySQLQuery /var/tmp/query.sql<CR>

	" Quick `.vimrc` handling
	noremap <LEADER>v :e $MYVIMRC<CR>
	noremap <LEADER>V :exec 'tabdo windo source $MYVIMRC'<CR>:noh<CR>

" ------------------------------------------------------------------------------
" KEY MAPPINGS (VISUAL MODE)
" ------------------------------------------------------------------------------

	" Ignore Shift-K
	vnoremap K k

	" Sort/Column visual selection
	vnoremap <LEADER>S :sort<CR>
	vnoremap <LEADER>C :!column -tx -s ' ' \| sed 's/ \([^ ]\)/\1/g'<CR>

	" Search visual selection
	vnoremap <silent> * :<C-U>
		\let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
		\gvy/<C-R><C-R>=substitute(
		\escape(@", '/\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
		\gV:call setreg('"', old_reg, old_regtype)<CR>
	vnoremap <silent> # :<C-U>
		\let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
		\gvy?<C-R><C-R>=substitute(
		\escape(@", '?\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
		\gV:call setreg('"', old_reg, old_regtype)<CR>

" ------------------------------------------------------------------------------
" KEY MAPPINGS (INSERT MODE)
" ------------------------------------------------------------------------------

	" Quick save
	inoremap <ESC><ESC> <ESC>:w<CR>a

	" Exit insert mode and save changes
	inoremap jj <ESC>:w<CR>

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

" ------------------------------------------------------------------------------
" KEY MAPPINGS (COMMAND MODE)
" ------------------------------------------------------------------------------

	" Enable numpad
	cmap <ESC>Oq 1
	cmap <ESC>Or 2
	cmap <ESC>Os 3
	cmap <ESC>Ot 4
	cmap <ESC>Ou 5
	cmap <ESC>Ov 6
	cmap <ESC>Ow 7
	cmap <ESC>Ox 8
	cmap <ESC>Oy 9
	cmap <ESC>On .
	cmap <ESC>OR *
	cmap <ESC>OQ /
	cmap <ESC>Ol +
	cmap <ESC>OS -

" ------------------------------------------------------------------------------
" VIMDIFF
" ------------------------------------------------------------------------------

	if &diff

		" Keymappings
		nnoremap <SPACE><SPACE> :qa<CR>
		nnoremap J              j]czzk
		nnoremap K              [czzk

	endif

" ------------------------------------------------------------------------------
" CUSTOM VIM CONFIGURATION
" ------------------------------------------------------------------------------

let b:dir = expand("%:p:h")
let b:vim = b:dir."/.vim"
if (filereadable(b:vim))
	execute "source ".b:vim
endif
