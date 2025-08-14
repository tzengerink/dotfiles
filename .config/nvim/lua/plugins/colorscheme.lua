return {
  {
    "folke/tokyonight.nvim",
    enabled = true,
    config = function()
      require("tokyonight").setup({
        style = "night",
        transparent = true,
        dim_inactive = false,
        terminal_colors = true,
        styles = {
          sidebars = "transparent",
          floats = "transparent",
        },
      })
      vim.cmd.colorscheme 'tokyonight'
    end,
  },
  {
    'EdenEast/nightfox.nvim',
    enabled = false,
    config = function()
      require("nightfox").setup({
        options = {
          transparent = true,
          dim_inactive = false,
        }
      })
      vim.cmd.colorscheme 'carbonfox'
    end,
  },
}
