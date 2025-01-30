-- Cycle through tabs
vim.api.nvim_set_keymap('n', '<C-]>', ':tabnext<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-[>', ':tabprevious<CR>', { noremap = true, silent = true })
