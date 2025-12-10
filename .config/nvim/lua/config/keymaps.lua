-- Tabs
vim.api.nvim_set_keymap('n', '<C-l>', ':tabnext<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-h>', ':tabprevious<CR>', { noremap = true, silent = true })

-- Wrap text
vim.keymap.set('n', '<LEADER>w', function()
  if vim.wo.wrap then
    vim.wo.wrap = false
    print("Wrap: OFF")
  else
    vim.wo.wrap = true
    print("Wrap: ON")
  end
end, { desc = "Toggle line wrap" })

-- Window resize
vim.api.nvim_set_keymap('n', '<C-w><C-Up>', '5<C-w>+', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-w><C-Down>', '5<C-w>-', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-w><C-Left>', '5<C-w><', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-w><C-Right>', '5<C-w>>', { noremap = true, silent = true })
