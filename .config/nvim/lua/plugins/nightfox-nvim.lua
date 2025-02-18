return {
  {
    'EdenEast/nightfox.nvim',
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
