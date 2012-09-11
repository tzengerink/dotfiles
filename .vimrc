" ------------------------------------------------------------------------------
" GENERAL SETTINGS
" ------------------------------------------------------------------------------

	set autoindent                   " Autoindenting
	set completeopt=longest,menuone  " Show menu and preview window
	set laststatus=2                 " Always show the StatusLine
	set matchpairs+=<:>              " Add HTML brackets to matching pairs
	set matchtime=1                  " Show matching bracket for .X seconds
	set nocompatible                 " Filetype detection works better this way
	set nocursorline                 " No cursorline by default
	set noerrorbells                 " No errorbells
	set novisualbell                 " No visualbell
	set nohidden                     " Closing tabs / windows also closes buffer
	set nonumber                     " No line numbers
	set nopaste                      " Do not disable autoindent etc. when pasting
	set nowrap                       " Do not wrap lines
	set ruler                        " Position info
	set scrolloff=0                  " Keep a margin of X lines when scrolling
	set shiftwidth=2                 " Shift width
	set showcmd                      " Show command in StatusLine
	set showmatch                    " Show matching brackets
	set smartindent                  " Use smart indenting
	set tabstop=2                    " Tab stop
	set wildignore=.svn,*.pyc        " Ignore files in wildmode
	set wildmode=longest,list,full   " Bash like path completion

" ------------------------------------------------------------------------------
" GUI SETTINGS
" ------------------------------------------------------------------------------

	if has("gui_running")

		" General
		set guioptions-=L                  " Disable scrollbars
		set guifont=Menlo\ Regular:h12     " Default font
		set fuoptions=maxvert,maxhorz      " Fullscreen options

		" Auto commands
		autocmd GUIEnter * set fullscreen  " Automatically enter fullscreen mode

	endif

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

	syntax on           " Turn on syntax highlighting
	filetype on         " Turn on filetype detection
	filetype plugin on  " Causes errors in filetype detection
	colors molokai      " Colorscheme

  " Highlight Visual
  highlight Visual ctermbg=lightblue ctermfg=black

	" Highlight Invalid Style (not for help files)
	highlight InvalidStyle ctermbg=red ctermfg=lightred
	autocmd FileType help
		\ highlight InvalidStyle ctermbg=bg ctermfg=fg

	" Change cursor / Toggle cursorline when entering/leaving insert mode
	autocmd InsertEnter,InsertLeave * set cursorline!
	let &t_SI = "\<Esc>]50;CursorShape=2\x7"
	let &t_EI = "\<Esc>]50;CursorShape=0\x7"

" ------------------------------------------------------------------------------
" AUTO COMMANDS
" ------------------------------------------------------------------------------

	" Different settings for active/focussed window
	if has("gui_running")
		setlocal relativenumber
		autocmd BufEnter * setlocal relativenumber
		autocmd BufLeave * setlocal norelativenumber
		autocmd FocusLost * :set number
		autocmd FocusGained * :set relativenumber
	else
		setlocal number
		autocmd BufEnter * setlocal number
		autocmd BufLeave * setlocal nonumber
	endif

	" Repeat comments
	autocmd FileType * set formatoptions=croql
	autocmd FileType * set comments=s1:/*,mb:*,ex:*/

	" Change directory
	autocmd BufEnter * silent! lcd %:p:h

	" Highlight inline tabs as invalid style
	autocmd BufEnter,BufLeave,InsertEnter,InsertLeave *
		\ match InvalidStyle /[^\t]\zs\t\+/

	" Check for trailing whitespaces / remove them when saving
	autocmd BufWritePre * :%s/\s\+$//e

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
	nnoremap <LEADER>Th :set filetype=html<CR>
	nnoremap <LEADER>Tj :set filetype=htmljinja<CR>
	nnoremap <LEADER>Tm :set filetype=mysql<CR>
	nnoremap <LEADER>Ts :set filetype=sql<CR>

" ------------------------------------------------------------------------------
" PLUGIN SETTINGS
" ------------------------------------------------------------------------------

	" NERDTree
	nmap <C-n> :NERDTreeToggle<CR>

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

	" Toggle InvalidStyle
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

	" SmartIndent on blank line
	function! IndentWithI()
		if len(getline('.')) == 0
				return "\"_ddO"
		else
				return "i"
		endif
	endfunction

	" Toggle Relative Number
	function! ToggleRelativeNumber()
		if(&relativenumber == 1)
			set number
		else
			set relativenumber
		endif
	endfunction

" ------------------------------------------------------------------------------
" KEY MAPPINGS (NORMAL MODE)
" ------------------------------------------------------------------------------

	" Quick command line access
	noremap ; :
	noremap :: ;

	" Open file in default application
	nmap <C-O> :! open %<CR><CR>

	" Yank to end of line
	nmap Y y$

	" Clear entire file
	nmap <LEADER>C ggvG$c

	" SmartIndent on blank line
	nnoremap <EXPR> i IndentWithI()

	" Save/Quit mappings
	nmap <LEADER>s  :w<CR>
	nmap <LEADER>wa :wa<CR>
	nmap <LEADER>wq :wq<CR>
	nmap <LEADER>qa :qa<CR>
	nmap <LEADER>qq :q<CR>
	nmap <LEADER>WW :%!sudo tee > /dev/null %<CR>

	" Toggle stuff
	nmap <LEADER>A :set wrap! wrap?<CR>
	nmap <LEADER>H :noh<CR>
	nmap <LEADER>I :exe ToggleInvalidStyle()<CR>
	nmap <LEADER>N :set number! number?<CR>
	nmap <LEADER>P :set paste! paste?<CR>
	nmap <LEADER>R :call ToggleRelativeNumber()<CR>

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
