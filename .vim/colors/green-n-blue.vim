" Vim color file
"
" Author: Teun Zengerink <t.zengerink@gmail.com>

set t_Co=256        " Use 256 colors
set t_ut=           " Disable background color erase
set background=dark " Use dark background

syntax on           " Turn on syntax highlighting
highlight clear     " Clear all highlighting

" Code syntax
highlight Normal          ctermfg=250  ctermbg=234
highlight Underlined      ctermfg=250  ctermbg=234  cterm=underline
highlight Comment         ctermfg=238  ctermbg=none
highlight SpecialComment  ctermfg=238  ctermbg=none
highlight Delimiter       ctermfg=238  ctermbg=none

highlight String          ctermfg=39   ctermbg=none
highlight Character       ctermfg=39   ctermbg=none

highlight Constant        ctermfg=30   ctermbg=none
highlight Number          ctermfg=30   ctermbg=none
highlight Boolean         ctermfg=30   ctermbg=none
highlight Float           ctermfg=30   ctermbg=none

highlight Statement       ctermfg=70   ctermbg=none
highlight Conditional     ctermfg=70   ctermbg=none
highlight Repeat          ctermfg=70   ctermbg=none
highlight Operator        ctermfg=70   ctermbg=none
highlight Keyword         ctermfg=70   ctermbg=none
highlight SpecialChar     ctermfg=70   ctermbg=none
highlight Tag             ctermfg=70   ctermbg=none

highlight Define          ctermfg=117  ctermbg=none
highlight Type            ctermfg=117  ctermbg=none
highlight Structure       ctermfg=117  ctermbg=none
highlight Typedef         ctermfg=117  ctermbg=none
highlight Special         ctermfg=117  ctermbg=none

highlight Function        ctermfg=42   ctermbg=none
highlight Exception       ctermfg=42   ctermbg=none
highlight PreProc         ctermfg=42   ctermbg=none
highlight Include         ctermfg=42   ctermbg=none
highlight PreCondit       ctermfg=42   ctermbg=none

highlight Identifier      ctermfg=67   ctermbg=none
highlight StorageClass    ctermfg=67   ctermbg=none

highlight Label           ctermfg=193  ctermbg=none
highlight Macro           ctermfg=193  ctermbg=none
highlight Debug           ctermfg=193  ctermbg=none

" Special types
highlight Folded          ctermfg=30   ctermbg=0
highlight FoldColumn      ctermfg=30   ctermbg=234
highlight InvalidStyle    ctermfg=124  ctermbg=none
highlight NonText         ctermfg=235  ctermbg=none
highlight SpecialKey      ctermfg=235  ctermbg=none
highlight SpellBad        ctermfg=124  ctermbg=174   cterm=underline
highlight WhiteSpace      ctermfg=235  ctermbg=none

" Editor
highlight Cursor          ctermfg=232  ctermbg=250
highlight CursorLine      ctermfg=none ctermbg=236  cterm=none
highlight CursorColumn    ctermfg=none ctermbg=232  cterm=none
highlight CursorLineNr    ctermfg=248  ctermbg=236
highlight LineNr          ctermfg=238  ctermbg=none
highlight SignColumn      ctermfg=none ctermbg=234
highlight StatusLine      ctermfg=232  ctermbg=248
highlight StatusLineNC    ctermfg=232  ctermbg=238
highlight TabLine         ctermfg=238  ctermbg=232  cterm=none
highlight TabLineFill     ctermfg=232  ctermbg=232
highlight Visual          ctermfg=232  ctermbg=39
highlight VertSplit       ctermfg=232  ctermbg=232
highlight MatchParen      ctermfg=0    ctermbg=30

" Autocomplete
highlight Pmenu           ctermfg=37   ctermbg=232
highlight PmenuSel        ctermfg=193  ctermbg=70
highlight PmenuSbar       ctermfg=none ctermbg=232
highlight PmenuThumb      ctermfg=100  ctermbg=none

" NERDtree
highlight Title           ctermfg=67   ctermbg=none
highlight Directory       ctermfg=70   ctermbg=none

" Diff
highlight DiffAdd         ctermfg=none ctermbg=22
highlight DiffChange      ctermfg=100  ctermbg=0
highlight DiffDelete      ctermfg=160  ctermbg=52
highlight DiffText        ctermfg=none ctermbg=58

" Messages
highlight Error           ctermfg=124  ctermbg=174   cterm=underline
highlight Search          ctermfg=193  ctermbg=70
highlight IncSearch       ctermfg=70   ctermbg=193
highlight Todo            ctermfg=238  ctermbg=70
highlight ModeMsg         ctermfg=45   ctermbg=none
highlight MoreMsg         ctermfg=45   ctermbg=none
highlight WarningMsg      ctermfg=174  ctermbg=124
