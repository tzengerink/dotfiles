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
}
