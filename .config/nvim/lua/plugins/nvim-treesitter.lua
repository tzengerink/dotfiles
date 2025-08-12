return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      config = require('nvim-treesitter.configs')
      config.setup({
        ensure_installed = {
          "lua",
          "vim",
          "vimdoc",
          "typescript",
          "tsx",
          "javascript",
          "html",
          "markdown",
          "json",
          "bash",
          "gitignore",
          "dockerfile",
        },
        sync_install = false,
        highlight = { enable = true },
        indent = { enable = true },
      });
    end,
  },
}
