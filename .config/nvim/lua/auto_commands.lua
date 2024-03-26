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
