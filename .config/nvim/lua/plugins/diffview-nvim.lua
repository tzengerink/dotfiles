return {
  {
    'sindrets/diffview.nvim',
    keys = {
      { '<LEADER>gd', '<cmd>DiffviewOpen<CR>', desc = 'Open Diffview' },
      { '<LEADER>gD', '<cmd>DiffviewClose<CR>', desc = 'Close Diffview' },
      { '<LEADER>gh', '<cmd>DiffviewFileHistory<CR>', desc = 'File History' },
      { '<LEADER>gH', '<cmd>DiffviewOpen HEAD~1<CR>', desc = 'Open Diffview HEAD~1' },
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
