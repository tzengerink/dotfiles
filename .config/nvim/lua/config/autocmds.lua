-- Remove trailing whitespace
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
  pattern = { "*" },
  command = [[%s/\s\+$//e]],
})

-- Auto reload files
vim.api.nvim_create_autocmd({ "BufEnter" }, {
  pattern = { "*" },
  command = ":checktime",
})

-- Markdown
vim.api.nvim_create_autocmd("FileType", {
  pattern = 'markdown',
  callback = function()
    vim.opt_local.tabstop = 2
    vim.opt_local.shiftwidth = 2
    vim.opt_local.expandtab = false
    vim.opt_local.wrap = true
  end
})
