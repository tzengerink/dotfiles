return {
  {
    "olimorris/codecompanion.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "ibhagwan/fzf-lua",
    },
    opts = {
      strategies = {
        chat = {
          adapter = "mistral",
        },
        inline = {
          adapter = "mistral",
        },
      },
      display = {
        chat = {
          window = {
            layout = 'vertical',
            position = 'right',
            width = 80,
          },
        },
      },
    },
    keys = {
      { '<LEADER>a', '<CMD>CodeCompanionChat Toggle<CR>', { noremap = true, silent = true } },
      { '<LEADER>A', '<CMD>CodeCompanionActions<CR>', { noremap = true, silent = true } }
    },
  },
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
