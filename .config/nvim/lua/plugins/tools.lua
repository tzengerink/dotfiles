return {
  {
    "nickvandyke/opencode.nvim",
    config = function()
      vim.g.opencode_opts = {
        provider = {
          enabled = "tmux",
          tmux = {
            options = "-h", -- horizontal split
          },
        },
      }

      vim.o.autoread = true
      vim.keymap.set({ "n", "x" }, "<C-a>", function() require("opencode").ask("@this: ", { submit = true }) end, { desc = "Ask opencode" })
      vim.keymap.set({ "n", "x" }, "<C-x>", function() require("opencode").select() end, { desc = "Execute opencode action..." })
    end,
  },
  {
    'preservim/nerdcommenter',
    event = "VeryLazy",
  },
  {
    'github/copilot.vim',
    enabled = false,
    init = function()
      vim.g.copilot_no_tab_map = true
      vim.keymap.set('i', '<C-L>', 'copilot#Accept("\\<CR>")', { expr = true, replace_keycodes = false } )
    end,
  },
  {
    "chentoast/marks.nvim",
    enabled = false,
    event = "VeryLazy",
    opts = {},
  },
  {
    "folke/zen-mode.nvim",
    enabled = false,
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
