" ------------------------------------------------------------------------------
" GENERAL SETTINGS
" ------------------------------------------------------------------------------

	set autoindent                      " Autoindenting
	set completeopt=longest,menuone     " Show menu and preview window
	set laststatus=2                    " Always show the StatusLine
	set list                            " Show non text characters
	set listchars=eol:¬,tab:•·,trail:·  " Characters to use for non text
	set matchpairs+=<:>                 " Add HTML brackets to matching pairs
	set matchtime=1                     " Show matching bracket for .X seconds
	set nocompatible                    " Filetype detection works better this way
	set nocursorline                    " No cursorline by default
	set noerrorbells                    " No errorbells
	set novisualbell                    " No visualbell
	set nohidden                        " Closing tabs / windows also closes buffer
	set nonumber                        " No line numbers
	set nopaste                         " Do not disable autoindent etc. when pasting
	set nowrap                          " Do not wrap lines
	set number                          " Show line numbers
	set ruler                           " Position info
	set scrolloff=0                     " Keep a margin of X lines when scrolling
	set shiftwidth=2                    " Shift width
	set showcmd                         " Show command in StatusLine
	set showmatch                       " Show matching brackets
	set smartindent                     " Use smart indenting
	set tabstop=2                       " Tab stop
	set wildignore=.svn,*.pyc           " Ignore files in wildmode
	set wildmode=longest,list,full      " Bash like path completion

" ------------------------------------------------------------------------------
" FOLDING SETTINGS
" ------------------------------------------------------------------------------

	set foldenable         " (Don't) fold by default (foldenable / nofoldenable)
	set foldlevel=1        " Use X levels of folding
	set foldmarker={,}     " Set brackets as default fold marker
	set foldmethod=indent  " Method of folding
	set foldminlines=1     " Do not fold when less then X lines
	set foldnestmax=2      " Maximum of X nested folds

" ------------------------------------------------------------------------------
" SEARCH & BACKUP SETTINGS
" ------------------------------------------------------------------------------

	set hlsearch                 " Highlight Search
	set incsearch                " Incremental Search
	set ignorecase               " Ignore cases when searching ..
	set smartcase                " .. unless uppercase in term
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

	set t_Co=256        " Use 256 colors
	syntax on           " Turn on syntax highlighting
	filetype on         " Turn on filetype detection
	filetype plugin on  " Causes errors in filetype detection
	colors molokai      " Colorscheme

	" Change cursor in insert-mode
	let &t_SI = "\<Esc>]50;CursorShape=2\x7"
	let &t_EI = "\<Esc>]50;CursorShape=0\x7"

	" Highlight Visual
	highlight CursorLine   ctermbg=234  ctermfg=none
	highlight InvalidStyle ctermbg=174  ctermfg=124
	highlight LineNr       ctermbg=234  ctermfg=249
	highlight NonText      ctermfg=236  ctermbg=none
	highlight SpecialKey   ctermfg=236  ctermbg=none
	highlight Search       ctermfg=174  ctermbg=124
	highlight StatusLine   ctermfg=234  ctermbg=249
	highlight StatusLineNC ctermfg=234  ctermbg=239
	highlight Visual       ctermbg=45   ctermfg=0

" ------------------------------------------------------------------------------
" AUTO COMMANDS
" ------------------------------------------------------------------------------

	" Run function if no files given
	autocmd VimEnter * call EmptyStartUp()

	" Different settings for active/focussed window
	augroup WinToggleNumber
		autocmd!
		autocmd WinEnter * setlocal number
		autocmd WinLeave * setlocal nonumber
	augroup end

	" Repeat comments
	autocmd FileType * set formatoptions=croql
	autocmd FileType * set comments=s1:/*,mb:*,ex:*/

	" Change directory
	autocmd BufEnter * silent! lcd %:p:h

	" Highlight inline tabs as invalid style
	autocmd BufEnter,BufLeave,InsertEnter,InsertLeave *
		\ match InvalidStyle /[^\t]\zs\t\+/

	" Check for trailing whitespaces / remove them when saving
	autocmd FileType conf let b:noStripWhiteSpace=1
	autocmd BufWritePre * call StripTrailingWhiteSpace()

	" Do NOT higlight invalid style in help files
	autocmd FileType help highlight InvalidStyle ctermbg=bg ctermfg=fg

	" Toggle cursorline when entering/leaving insert mode
	autocmd InsertEnter,InsertLeave * set cursorline!

" ------------------------------------------------------------------------------
" FILETYPES
" ------------------------------------------------------------------------------

	" Set filetypes for certain extensions
	autocmd BufNewFile,BufRead *.css
		\ set filetype=css
	autocmd BufNewFile,BufRead *.html,*.htm
		\ set filetype=html
	autocmd BufNewFile,BufRead *.markdown,*.mkdn,*.mdown,*.md,*.mkd
		\ set filetype=markdown
	autocmd BufNewFile,BufRead *.mustache
		\ set filetype=mustache
	autocmd BufNewFile,BufRead *.sql
		\ set filetype=mysql
	autocmd BufNewFile,BufRead *.plist
		\ set filetype=xml

	" Override default PHP filetype settings
	autocmd BufNewFile,BufRead *.php
		\ set foldnestmax=2

	" Easy filetype switching
	nnoremap <LEADER>th :set filetype=html<CR>
	nnoremap <LEADER>tj :set filetype=htmljinja<CR>
	nnoremap <LEADER>tm :set filetype=mysql<CR>
	nnoremap <LEADER>ts :set filetype=sql<CR>

" ------------------------------------------------------------------------------
" PLUGIN SETTINGS
" ------------------------------------------------------------------------------

	" NERDTree
	let NERDTreeWinSize = 40
	nmap <C-n> :NERDTreeToggle<CR>

	" NerdCommenter
	nmap <C-x> <LEADER>c<SPACE>

	" OmniComplete
	imap <C-o> <C-x><C-o>

	" ZenCoding
	let g:user_zen_leader_key     = '<C-y>'
	let g:user_zen_expandabbr_key = '<C-e>'

	" Closetag
	" Usage: <C-_> closes current tag
	let g:closetag_default_xml=1
	autocmd FileType html,htmljinja,php let b:closetag_html_style=1
	autocmd FileType html,htmljinja,php,xml source ~/.vim/scripts/closetag.vim

" ------------------------------------------------------------------------------
" FUNCTIONS
" ------------------------------------------------------------------------------

	" Get the number of columns for a given line
	function! CountColumns( lineNum )
		return len(getline(a:lineNum))
	endfunction

	" Empty startup function
	function! EmptyStartUp()
		if 0 == argc()
			NERDTree
		endif
	endfunction

	" Fill line with string up to given textwidth
	function! FillLine( str, ... )
		let tw = 80
		" Set tw to desired length
		if a:0 > 0 | let tw = a:1 | endif
		" Strip trailing spaces
		.s/[[:space:]]*$//
		" Calculate number of `str`s to insert
		let reps = (tw - col("$")) / len(a:str)
		" Insert `str`s
		if reps > 0
			.s/$/\=(' '.repeat(a:str, reps))/
		endif
	endfunction

	" SmartIndent on blank line
	function! IndentWithI()
		if len(getline('.')) == 0
				return "\"_ddO"
		else
				return "i"
		endif
	endfunction

	" Choose file using ranger
	function! RangerChooser()
		exec "silent !ranger --choosefile=/tmp/chosenfile " . expand("%:p:h")
		if filereadable('/tmp/chosenfile')
			exec 'edit ' . system('cat /tmp/chosenfile')
			call system('rm /tmp/chosenfile')
		endif
		redraw!
	endfunction

	" Strip trailing whitespace
	function! StripTrailingWhiteSpace()
		" Exclude these filetypes
		if exists('b:noStripWhiteSpace')
			return
		endif
		%s/\s\+$//e
	endfunction

	" Toggle InvalidStyle highlighting
	let s:invalidStyleIsVisible = 1
	function! ToggleInvalidStyle()
		if (s:invalidStyleIsVisible)
			let s:invalidStyleIsVisible = 0
			return "set background=dark | colors ".g:colors_name
		else
			let s:invalidStyleIsVisible = 1
			return "highlight InvalidStyle ctermbg=red ctermfg=white"
		endif
	endfunction

	" Underline the previous line with string
	function! UnderLine( str )
		let lineNumber = line('.') - 1
		let lineWidth = CountColumns(lineNumber)
		call FillLine(a:str, lineWidth)
	endfunction

" ------------------------------------------------------------------------------
" COMMANDS
" ------------------------------------------------------------------------------

	command! -nargs=* FillLine           call FillLine(<f-args>)
	command! -nargs=0 Ranger             call RangerChooser()
	command! -nargs=0 ToggleInvalidStyle call ToggleInvalidStyle()
	command! -nargs=* UnderLine          call UnderLine(<f-args>)

" ------------------------------------------------------------------------------
" KEY MAPPINGS (NORMAL MODE)
" ------------------------------------------------------------------------------

	" Quick command line access
	noremap ; :
	noremap :: ;

	" Save/Quit mappings
	nmap <C-d>      :sh<CR>
	nmap <LEADER>s  :w<CR>
	nmap <LEADER>wa :wa<CR>
	nmap <LEADER>wq :wq<CR>
	nmap <LEADER>qa :qa<CR>
	nmap <LEADER>qq :q<CR>
	nmap <LEADER>WW :%!sudo tee > /dev/null %<CR>

	" Toggle stuff
	nmap <LEADER>A :set wrap! wrap?<CR>
	nmap <LEADER>H :noh<CR>
	nmap <LEADER>L :set list! list?<CR>
	nmap <LEADER>N :set number! number?<CR>
	nmap <LEADER>P :set paste! paste?<CR>

	" Folding / Unfolding
	nmap <LEADER>f       zM
	nmap <LEADER>F       zR
	nmap <SPACE>         za
	nmap <LEADER><SPACE> zMzv

	" Tabs
	nmap <C-H> :tabp<CR>
	nmap <C-L> :tabn<CR>
	nmap <C-J> :tabnew<CR>

	" Buffers
	nmap <RIGHT>    :bnext<CR>
	nmap <LEFT>     :bprevious<CR>
	nmap <LEADER>b  :buffers<CR>:buffer<SPACE>
	nmap <LEADER>BD :bd<CR>

	" Commands
	nnoremap <LEADER>r :Ranger<CR>
	nnoremap <LEADER>u :UnderLine -<CR>

	" Windows
	nmap =          <C-W>+
	nmap -          <C-W>-
	nmap _          <C-W><
	nmap +          <C-W>>
	nmap WH         :leftabove vnew<CR>
	nmap WJ         :rightbelow new<CR>
	nmap WL         :rightbelow vnew<CR>
	nmap WK         :leftabove new<CR>
	nmap <LEADER>\  :vertical resize 85<CR>
	nmap <LEADER>\\ <C-W>=

	" Cycle through changelist
	nmap <UP>   g;<CR>k
	nmap <DOWN> g,<CR>k

	" Sessions
	nmap <LEADER>SS :wa<CR>:mksession! ~/.vim/sessions/default
	nmap <LEADER>SO :wa<CR>:so ~/.vim/sessions/default

	" Open file in default application
	nmap <C-O> :! open %<CR><CR>

	" Yank to end of line
	nmap Y y$

	" Clear entire file
	nmap <LEADER>C ggvG$c

	" Auto-indent
	nnoremap <EXPR> i IndentWithI()

	" Temporary SQL query
	nmap <LEADER>tq :e /var/tmp/query.sql<CR>:set ft=mysql<CR>

	" Quick `.vimrc` handling
	nmap <LEADER>v :e $MYVIMRC<CR>
	nmap <LEADER>V :exec 'tabdo windo source $MYVIMRC'<CR>:noh<CR>

" ------------------------------------------------------------------------------
" KEY MAPPINGS (VISUAL MODE)
" ------------------------------------------------------------------------------

	" Sort visual selection
	vnoremap <LEADER>s :sort<CR>

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

	" Exit insert mode and save document
	inoremap <LEADER>s <ESC>:w<CR>

	" Exit insert mode
	inoremap jj <ESC>

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
