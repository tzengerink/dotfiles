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

	set fillchars=fold:·     " Character used as fill
	set foldenable           " (Don't) fold by default (foldenable / nofoldenable)
	set foldlevel=1          " Use X levels of folding
	set foldmarker={,}       " Set brackets as default fold marker
	set foldmethod=indent    " Method of folding
	set foldminlines=1       " Do not fold when less then X lines
	set foldnestmax=2        " Maximum of X nested folds
	set foldtext=FoldText()  " Function used to fold text

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
	highlight CursorLine   ctermfg=none ctermbg=234
	highlight Error        ctermfg=124  ctermbg=174  cterm=underline
	highlight InvalidStyle ctermfg=124  ctermbg=174
	highlight LineNr       ctermbg=234  ctermfg=249
	highlight NonText      ctermfg=236  ctermbg=none
	highlight SpecialKey   ctermfg=236  ctermbg=none
	highlight Search       ctermfg=174  ctermbg=124  cterm=underline
	highlight StatusLine   ctermfg=234  ctermbg=249
	highlight StatusLineNC ctermfg=234  ctermbg=239
	highlight TabLineFill  ctermfg=234  ctermbg=234
	highlight TabLine      ctermfg=239  ctermbg=234
	highlight Todo         ctermfg=206  ctermbg=129
	highlight Visual       ctermfg=0    ctermbg=45

" ------------------------------------------------------------------------------
" AUTO COMMANDS
" ------------------------------------------------------------------------------

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
	autocmd BufNewFile,BufRead *.coffee        set filetype=coffee
	autocmd BufNewFile,BufRead *.css           set filetype=css
	autocmd BufNewFile,BufRead *.html,*.htm    set filetype=html
	autocmd BufNewFile,BufRead *.less          set filetype=less
	autocmd BufNewFile,BufRead *.markdown,*.md set filetype=markdown
	autocmd BufNewFile,BufRead *.mustache      set filetype=mustache
	autocmd BufNewFile,BufRead *.plist         set filetype=xml
	autocmd BufNewFile,BufRead *.sql           set filetype=mysql

	" Omnicomplete
	autocmd  FileType css        set omnifunc=csscomplete#CompleteCSS
	autocmd  FileType html       set omnifunc=htmlcomplete#CompleteTags
	autocmd  FileType javascript set omnifunc=javascriptcomplete#CompleteJS
	autocmd  FileType python     set omnifunc=pythoncomplete#Complete

	" Easy filetype switching
	nnoremap <LEADER>ta :set filetype=htmljinja<CR>
	nnoremap <LEADER>tc :set filetype=css<CR>
	nnoremap <LEADER>th :set filetype=html<CR>
	nnoremap <LEADER>tj :set filetype=javascript<CR>
	nnoremap <LEADER>tm :set filetype=mysql<CR>
	nnoremap <LEADER>to :set filetype=coffee<CR>
	nnoremap <LEADER>tp :set filetype=php<CR>
	nnoremap <LEADER>tq :set filetype=jquery<CR>
	nnoremap <LEADER>ts :set filetype=sql<CR>
	nnoremap <LEADER>ty :set filetype=python<CR>

	" Override default filetype settings
	autocmd BufNewFile,BufRead *.coffee set sw=2 ts=2 et nosi foldlevel=0
	autocmd BufNewFile,BufRead *.less   set foldmethod=indent
	autocmd BufNewFile,BufRead *.php    set fdn=2 noet foldlevel=0

	" SetWrap for certain filetypes
	autocmd BufRead *.md,*.txt call SetWrap()

" ------------------------------------------------------------------------------
" PLUGIN SETTINGS
" ------------------------------------------------------------------------------

	" NERDTree
	let NERDTreeWinSize = 40

	" ZenCoding
	let g:user_zen_leader_key     = '<C-y>'
	let g:user_zen_expandabbr_key = '<C-e>'

	" PyDiction
	let g:pydiction_location = '~/.vim/plugin/pydiction/complete-dict'

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

	" Nicely fold text
	function! FoldText()
			let line = getline(v:foldstart)
			let nnum = nextnonblank(v:foldstart + 1)
			let cntr = 2
			while nnum < v:foldend
				let cntr = cntr + 1
				let nnum = nnum + 1
			endwhile
			let line = substitute(line, '^[ \t]*', '', 'g')
			return "··· " . cntr . " lines: " . line . " "
	endfunction

	" SmartIndent on blank line
	function! IndentWithI()
		if len(getline('.')) == 0
				return "\"_ddO"
		else
				return "i"
		endif
	endfunction

	" Wrap text nicely and readable
	function! SetWrap()
		setlocal wrap
		setlocal nolist
		setlocal linebreak
		setlocal formatoptions+=aln
		nnoremap <buffer> <silent> j gj
		nnoremap <buffer> <silent> k gk
	endfunction

	" Strip trailing whitespace
	function! StripTrailingWhiteSpace()
		" Exclude these filetypes
		if exists('b:noStripWhiteSpace')
			return
		endif
		%s/\s\+$//e
	endfunction

	" Tabcompletion
	function! TabCompletion( backwards )
	if strpart( getline('.'), 0, col('.')-1 ) =~ '^\s*$'
		return "\<Tab>"
	else
		if a:backwards
			return "\<C-P>"
		else
			return "\<C-N>"
		endif
	endif
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
	command! -nargs=* SetWrap            call SetWrap()
	command! -nargs=0 ToggleInvalidStyle call ToggleInvalidStyle()
	command! -nargs=* UnderLine          call UnderLine(<f-args>)

" ------------------------------------------------------------------------------
" KEY MAPPINGS (NORMAL MODE)
" ------------------------------------------------------------------------------

	" Quick command line access
	noremap ; :
	noremap :: ;

	" Save/Quit mappings
	noremap <C-d>      :sh<CR>
	noremap <ESC><ESC> <ESC>:w<CR>

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

	" Macros
	nnoremap <RETURN> @q

	" Plugins
	nnoremap  <C-n>     :NERDTreeToggle<CR>
	nnoremap  <C-x>     <LEADER>c<SPACE>
	inoremap  <C-o>     <C-x><C-o>
	nnoremap  <LEADER>j :JSHint<CR>

	" Tabs
	noremap <C-H> :tabp<CR>
	noremap <C-L> :tabn<CR>
	noremap <C-J> :tabnew<CR>

	" Buffers
	noremap <RIGHT>    :bnext<CR>
	noremap <LEFT>     :bprevious<CR>
	noremap <LEADER>b  :buffers<CR>:buffer<SPACE>

	" Commands
	nnoremap <LEADER>u :UnderLine -<CR>

	" Windows
	noremap =          <C-W>+
	noremap -          <C-W>-
	noremap _          <C-W><
	noremap +          <C-W>>
	noremap WH         :leftabove vnew<CR>
	noremap WJ         :rightbelow new<CR>
	noremap WL         :rightbelow vnew<CR>
	noremap WK         :leftabove new<CR>
	noremap <LEADER>\  :vertical resize 85<CR>
	noremap <LEADER>\\ <C-W>=

	" Cycle through changelist
	noremap <UP>   g;<CR>
	noremap <DOWN> g,<CR>

	" Sessions
	noremap <LEADER>SS :wa<CR>:mksession! ~/.vim/sessions/default<CR>
	noremap <LEADER>SO :wa<CR>:so ~/.vim/sessions/default<CR>

	" Open file in default application
	noremap <C-O> :! open %<CR><CR>

	" Yank to end of line
	noremap Y y$

	" Shift-K concatinate with line above
	nnoremap K kJ

	" Display
	nnoremap <LEADER>d :echo strftime("%c")<CR>

	" Clear entire file
	noremap <LEADER>C ggvG$c

	" Auto-indent
	nnoremap <EXPR> i IndentWithI()

	" Temporary SQL query
	noremap <LEADER>EQ :e /var/tmp/query.sql<CR>:set ft=mysql<CR>

	" Quick `.vimrc` handling
	noremap <LEADER>v :e $MYVIMRC<CR>
	noremap <LEADER>V :exec 'tabdo windo source $MYVIMRC'<CR>:noh<CR>

" ------------------------------------------------------------------------------
" KEY MAPPINGS (VISUAL MODE)
" ------------------------------------------------------------------------------

	" Quick save
	vnoremap <ESC><ESC> <ESC>:w<CR>gv

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

	" Tabcompletion
	inoremap <TAB>   <C-R>=TabCompletion(0)<CR>
	inoremap <S-TAB> <C-R>=TabCompletion(1)<CR>

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
" KEY MAPPINGS (VIMDIFF)
" ------------------------------------------------------------------------------

	if &diff

		nnoremap <SPACE><SPACE> :qa<CR>
		nnoremap J              ]czz
		nnoremap K              [czz

	endif
