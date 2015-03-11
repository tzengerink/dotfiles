" ------------------------------------------------------------------------------
" VUNDLE
" ------------------------------------------------------------------------------

	set nocompatible
	filetype off
	set rtp+=~/.vim/bundle/Vundle.vim
	call vundle#begin()

	" Let vundle manage itself
	Plugin 'gmarik/Vundle.vim'

	" Install all plugins? :PluginInstall
	Plugin 'airblade/vim-gitgutter'
	Plugin 'davidhalter/jedi-vim'
	Plugin 'fatih/vim-go'
	Plugin 'hdima/python-syntax'
	Plugin 'jamessan/vim-gnupg'
	Plugin 'michaeljsmith/vim-indent-object'
	Plugin 'scrooloose/nerdtree'
	Plugin 'tpope/vim-surround'
	Plugin 'vim-scripts/closetag.vim'
	Plugin 'vim-scripts/gnupg.vim'

	call vundle#end()
	filetype plugin indent on

	" Plugin settings
	let NERDTreeWinSize = 30
	let NERDTreeIgnore = ['\.pyc$', '__pycache__']
	let g:gitgutter_sign_column_always = 1
	let g:pydiction_location = '~/.vim/bundle/Pydiction/complete-dict'

	nnoremap <LEADER>G :GitGutterToggle<CR>
	nnoremap <LEADER>g :GitGutterLineHighlightsToggle<CR>
	nnoremap gh        :GitGutterNextHunk<CR>
	nnoremap gH        :GitGutterPrevHunk<CR>
	nnoremap <C-n>     :NERDTreeToggle<CR>

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
	set clipboard=unnamed                              " OS X compatible clipboard
	set completeopt=longest,menuone                    " Show menu and preview window
	set cursorline                                     " No cursorline by default
	set laststatus=2                                   " Always show the StatusLine
	set lazyredraw                                     " Do not redraw while running macros
	set list                                           " Show non text characters
	set listchars=eol:¬,tab:•·,trail:·                 " Characters to use for non text
	set matchpairs+=<:>                                " Add HTML brackets to matching pairs
	set matchtime=1                                    " Show matching bracket for .X seconds
	set modeline                                       " Allow modeline comment settings
	set modelines=5                                    " Check the first 5 lines for settings
	set noerrorbells                                   " No errorbells
	set novisualbell                                   " No visualbell
	set nohidden                                       " Closing tabs / windows also closes buffer
	set number                                         " Show line numbers
	set nopaste                                        " Do not disable autoindent etc. when pasting
	set nowrap                                         " Do not wrap lines
	set ruler                                          " Position info
	set scrolloff=5                                    " Keep a margin of X lines when scrolling
	set shiftwidth=2                                   " Shift width
	set showcmd                                        " Show command in StatusLine
	set showmatch                                      " Show matching brackets
	set smartindent                                    " Use smart indenting
	set tabstop=2                                      " Tab stop
	set tabline=%!CustomTabLine()                      " Custom tabline
	set wildignore=.svn,*.pyc                          " Ignore files in wildmode
	set wildmode=longest,list,full                     " Bash like path completion

	" Folding
	set fillchars=fold:·                               " Character used as fill
	set foldenable                                     " (Don't) fold by default (foldenable / nofoldenable)
	set foldlevel=1                                    " Use X levels of folding
	set foldmarker={,}                                 " Set brackets as default fold marker
	set foldmethod=indent                              " Method of folding
	set foldminlines=1                                 " Do not fold when less then X lines
	set foldnestmax=2                                  " Maximum of X nested folds
	set foldtext=FoldText()                            " Function used to fold text

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

	" Set filetypes for certain extensions
	autocmd BufNewFile,BufRead *.coffee     set filetype=coffee
	autocmd BufNewFile,BufRead *.css        set filetype=css
	autocmd BufNewFile,BufRead *.html,*.htm set filetype=html
	autocmd BufNewFile,BufRead *.less       set filetype=less
	autocmd BufNewFile,BufRead *.log        set filetype=log
	autocmd BufNewFile,BufRead *.md         set filetype=markdown
	autocmd BufNewFile,BufRead *.mustache   set filetype=mustache
	autocmd BufNewFile,BufRead *.plist      set filetype=xml
	autocmd BufNewFile,BufRead *.sql        set filetype=mysql
	autocmd BufNewFile,BufRead *.blade.php  set filetype=blade

	" Folder specifix filetypes
	autocmd BufNewFile,BufRead /etc/nginx/*   set filetype=nginx
	autocmd BufNewFile,BufRead /etc/nginx/*/* set filetype=nginx

	" Omnicomplete
	autocmd FileType css        set omnifunc=csscomplete#CompleteCSS
	autocmd FileType html       set omnifunc=htmlcomplete#CompleteTags
	autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
	autocmd FileType python     set omnifunc=pythoncomplete#Complete

	" Override default filetype settings
	autocmd BufNewFile,BufRead *.coffee set sw=2 ts=2 et nosi foldlevel=1
	autocmd BufNewFile,BufRead *.less   set foldmethod=indent fdn=4 noet
	autocmd BufNewFile,BufRead *.md     set et fdn=0 sw=4 ts=4
	autocmd BufNewFile,BufRead *.php    set fdn=2 noet foldlevel=1

	" SetWrap for certain filetypes
	autocmd BufRead *.md call SetWrap()

" ------------------------------------------------------------------------------
" FUNCTIONS
" ------------------------------------------------------------------------------

	" Get the number of columns for a given line
	function! CountColumns( lineNum )
		return len(getline(a:lineNum))
	endfunction

	" Custom TabLabel
	function! CustomTabLabel(n)
		let buflist = tabpagebuflist(a:n)
		let winnr = tabpagewinnr(a:n)
		let label = bufname(buflist[winnr - 1])
		let fname = fnamemodify(label, ':p:t')
		return len(fname) ? fname : '[No Name]'
	endfunction

	" Custom TabLine
	function! CustomTabLine()
		let s = ''
		for i in range(tabpagenr('$'))
			" Select the highlighting
			if i + 1 == tabpagenr()
				let s .= '%#TabLineSel#'
			else
				let s .= '%#TabLine#'
			endif
			" Set the tab page number (for mouse clicks)
			let s .= '%' . (i + 1) . 'T'
			" The label is made by CustomTabLabel()
			let s .= ' %{CustomTabLabel(' . (i + 1) . ')} '
		endfor
		" After the last tab fill with TabLineFill and reset tab page nr
		let s .= '%#TabLineFill#%T'
		" Right-align the label to close the current tab page
		if tabpagenr('$') > 1
			let s .= '%=%#TabLine#%999X '
		endif
		return s
	endfunction

	" Execute query from file
	let g:mysql_hostname = ''
	function! ExecuteMySQLQuery( str )
		let g:mysql_hostname = input('Hostname: '.g:mysql_hostname)
		exe "!mysql --defaults-file=~/.mysql/hosts/".g:mysql_hostname." < ".a:str
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

	" Toggle between line numbers and relative line numbers
	function! ToggleNumberType()
		if (&relativenumber == 1)
			set number
		else
			set relativenumber
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

	command! -nargs=* ExecuteMySQLQuery  call ExecuteMySQLQuery(<f-args>)
	command! -nargs=* FillLine           call FillLine(<f-args>)
	command! -nargs=* SetWrap            call SetWrap()
	command! -nargs=0 ToggleInvalidStyle call ToggleInvalidStyle()
	command! -nargs=* UnderLine          call UnderLine(<f-args>)

" ------------------------------------------------------------------------------
" ABBREVIATIONS
" ------------------------------------------------------------------------------

	" Open help in seperate tab
	cnoreabbrev h    tab h
	cnoreabbrev help tab help

" ------------------------------------------------------------------------------
" KEY MAPPINGS (NORMAL MODE)
" ------------------------------------------------------------------------------

	" Quick command line access
	noremap ; :
	noremap :: ;

	" Quick shell access
	noremap <C-d> :sh<CR>

	" Save file as superuser
	noremap <LEADER>WW :%!sudo tee > /dev/null %<CR>

	" Toggle stuff
	noremap <LEADER>A :set wrap! wrap?<CR>
	noremap <LEADER>H :noh<CR>
	noremap <LEADER>L :set list! list?<CR>
	noremap <LEADER>N :set number! number?<CR>
	noremap <LEADER>P :set paste! paste?<CR>
	noremap <LEADER>R :call ToggleNumberType()<CR>

	" Folding / Unfolding
	noremap <LEADER>f       zM
	noremap <LEADER>F       zR
	noremap <SPACE>         za
	noremap <LEADER><SPACE> zMzv

	" Execute macro at `q`
	nnoremap ! @q

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

	" Auto-indent
	nnoremap <EXPR> i IndentWithI()

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

	" Tabcompletion
	inoremap <TAB>   <C-R>=TabCompletion(0)<CR>
	inoremap <S-TAB> <C-R>=TabCompletion(1)<CR>

	" Quick save
	inoremap <ESC><ESC> <ESC>:w<CR>a

	" Exit insert mode and save changes
	inoremap jj <ESC>:w<CR>

	" Commands
	inoremap <LEADER>u <ESC>:UnderLine -<CR>o

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
		nnoremap J              ]czz
		nnoremap K              [czz

	endif
