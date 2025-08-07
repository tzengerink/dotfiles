return {
  {
    'lewis6991/gitsigns.nvim',
    enabled = true,
    lazy = false,
    keys = {
      { '<C-p>', ':Gitsigns preview_hunk<CR>', { noremap = true, silent = true } },
      { '<C-a>', ':Gitsigns stage_hunk<CR>', { noremap = true, silent = true } },
      { '<C-d>', ':Gitsigns undo_stage_hunk<CR>', { noremap = true, silent = true } },
      { '<C-u>', ':Gitsigns reset_hunk<CR>', { noremap = true, silent = true } },
      { '<C-j>', ':Gitsigns next_hunk<CR>', { noremap = true, silent = true } },
      { '<C-k>', ':Gitsigns prev_hunk<CR>', { noremap = true, silent = true } },
    },
    config = function()
      require('gitsigns').setup({
        signcolumn = true,
        numhl = true,
        linehl = true,
        word_diff = false,
        current_line_blame = true,
        current_line_blame_opts = {
          virt_text_pos = 'eol',
          delay = 1000,
        },
      })
    end,
  },
}
