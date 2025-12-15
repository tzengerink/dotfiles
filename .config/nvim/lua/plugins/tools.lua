return {
  {
    'github/copilot.vim',
    enabled = false,
    init = function()
      vim.g.copilot_no_tab_map = true
      vim.keymap.set('i', '<C-J>', 'copilot#Accept("\\<CR>")', { expr = true, replace_keycodes = false } )
    end,
  },
  {
    'preservim/nerdcommenter',
    event = "VeryLazy",
  },
  {
    "chentoast/marks.nvim",
    event = "VeryLazy",
    opts = {},
  },
  {
    "folke/zen-mode.nvim",
    event = "VeryLazy",
    keys = {
      {
        "<LEADER>z",
        function()
          require("zen-mode").toggle()
        end,
        desc = "Toggle Zen Mode",
      },
    },
    opts = {
      window = {
        width = 120,
        height = 0.97,
      },
      plugins = {
        tmux = {
          enabled = true,
        },
      },
    },
  },
}
