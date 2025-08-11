return {
  {
    'sindrets/diffview.nvim',
    keys = {
      { '<leader>gd', '<cmd>DiffviewOpen<cr>', desc = 'Open Diffview' },
      { '<leader>gD', '<cmd>DiffviewClose<cr>', desc = 'Close Diffview' },
      { '<leader>gh', '<cmd>DiffviewFileHistory<cr>', desc = 'File History' },
    },
    config = function()
      require('diffview').setup({
        enhanced_diff_hl = true,
        file_panel = {
          win_config = {
            position = 'left',
            width = 60,
          },
        },
      })
    end,
  },
}
