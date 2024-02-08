local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- General
keymap('n', '<Tab>', ':bnext<CR>', opts)
keymap('n', '<S-Tab>', ':bprevious<CR>', opts)
keymap('n', '<C-n>', ':NvimTreeFindFileToggle!<CR>', opts)
keymap('n', '<leader>h', ':noh<CR>', opts)

-- Windows
keymap('n', '=', ':vertical resize +5<CR>', opts)
keymap('n', '-', ':vertical resize -5<CR>', opts)
keymap('n', '+', ':resize +5<CR>', opts)
keymap('n', '_', ':resize -5<CR>', opts)
keymap('n', 'WH', ':leftabove vnew<CR>', opts)
keymap('n', 'WJ', ':rightbelow new<CR>', opts)
keymap('n', 'WL', ':rightbelow vnew<CR>', opts)
keymap('n', 'WK', ':leftabove new<CR>', opts)

-- Telescope
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fc', builtin.commands, {})
keymap('n', 'gd', '<cmd>lua require"telescope.builtin".lsp_definitions()<CR>', opts)
-- keymap('n', 'gt', '<cmd>lua require"telescope.builtin".lsp_type_definitions()<CR>', opts)

-- Autocomplete
vim.cmd([[
  inoremap <expr> <cr> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"
  inoremap <expr> <Tab> coc#pum#visible() ? coc#pum#next(1) : "\<Tab>"
  inoremap <expr> <S-Tab> coc#pum#visible() ? coc#pum#prev(1) : "\<S-Tab>"
]])

-- Auto import
keymap('n', '<leader>a', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)

-- Hop
local hop = require('hop')
hop.setup()
local directions = require('hop.hint').HintDirection
vim.keymap.set('', 'ss', function()
  hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = false })
end, {remap=true})
vim.keymap.set('', 'SS', function()
  hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = false })
end, {remap=true})


-- Prettier
vim.cmd([[
  let g:prettier#exec_cmd_async = 1
  let g:prettier#autoformat = 1
  let g:prettier#autoformat_require_pragma = 0
]])
