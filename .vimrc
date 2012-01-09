" --------------------------------------------------------------------------------
" VISUAL SETTINGS
" --------------------------------------------------------------------------------
set tabstop=3                  " Tab stop
set shiftwidth=3               " Shift width
set ruler                      " Position info
set autoindent                 " Autoindenting
set cindent                    " Use auto C-indenting
set hlsearch                   " Highlight Search
set incsearch                  " Incremental Search
set number                     " Add line numbers
set wildmode=longest,list,full " Bash like path completion

" Other cursor shape if in insert mode
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

" --------------------------------------------------------------------------------
" BACKUP SETTINGS
" --------------------------------------------------------------------------------
set backup
set backupdir=~/.vim/backup " Where to put the backup files
set directory=~/.vim/swap   " Where to put the swap files

" --------------------------------------------------------------------------------
" SYNTAX AND FILETYPE SETTINGS
" --------------------------------------------------------------------------------
syntax on          " Turn on syntax highlighting
colors molokai     " Use molokai color scheme
filetype on        " Turn on filetype detection

" Python
autocmd FileType python set tabstop=4|set shiftwidth=4|set expandtab|set textwidth=79

" --------------------------------------------------------------------------------
" PLUGIN SETTINGS
" --------------------------------------------------------------------------------
" NERDTree
map <C-n> :NERDTreeToggle<CR>

" ZenCoding
let g:user_zen_leader_key     = '<C-y>'
let g:user_zen_expandabbr_key = '<C-e>'

" --------------------------------------------------------------------------------
" KEY MAPPINGS
" --------------------------------------------------------------------------------
" Quick save
map <leader>s :update<CR>

" Tabs
map <C-h> :tabp<CR>
map <C-l> :tabn<CR>

" Adjust horizontal / vertical split size
map = <C-W>+
map - <C-W>-
map _ <C-W><
map + <C-W>>

" Edit & reload .vimrc
map <leader>v :e $MYVIMRC<CR>
map <leader>V :exec 'tabdo windo source $MYVIMRC'<CR>
