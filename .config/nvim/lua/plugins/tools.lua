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
    "huggingface/llm.nvim",
    enabled = false,
    opts = {
      backend = "ollama",
      model = "codegemma:2b-code",
      context_window = 512
      url = "http://localhost:11434",
      tokens_to_clear = { "<|file_separator|>" },
      -- configure fim for qwen2.5-coder models AI!
      fim = {
        enabled = true,
        prefix = "<|fim_prefix|>",
        middle = "<|fim_middle|>",
        suffix = "<|fim_suffix|>",
      },
      debounce_ms = 500,
      accept_keymap = "<C-J>",
      dismiss_keymap = "<C-K>",
      request_body = {
        options = { temperature = 0.2, top_p = 0.95 },
      },
    },
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
