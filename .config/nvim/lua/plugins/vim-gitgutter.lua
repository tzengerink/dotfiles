return {
  {
    'airblade/vim-gitgutter',
    keys = {
      { '<C-u>', ':GitGutterUndoHunk<CR>', { noremap = true, silent = true }},
      { '<C-j>', ':GitGutterNextHunk<CR>', { noremap = true, silent = true }},
      { '<C-k>', ':GitGutterPrevHunk<CR>', { noremap = true, silent = true }},
    },
  },
}
