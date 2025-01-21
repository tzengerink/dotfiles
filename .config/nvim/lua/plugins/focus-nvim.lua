local ignore_filetypes = { 'NvimTree' }
local augroup = vim.api.nvim_create_augroup('FocusDisable', { clear = true })

vim.api.nvim_create_autocmd('FileType', {
  group = augroup,
  callback = function(_)
    if vim.tbl_contains(ignore_filetypes, vim.bo.filetype) then
      vim.b.focus_disable = true
    else
      vim.b.focus_disable = false
    end
  end,
  desc = 'Disable focus autoresize for FileType',
})

return {
  {
    'nvim-focus/focus.nvim',
    version = '*',
    opts = {
      autoresize = {
        minwidth = 30,
        minheight = 30,
      },
      ui = {
        cursorline = false,
        signcolumn = false,
      },
    },
  },
}
