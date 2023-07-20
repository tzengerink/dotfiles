-- Disable netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- General
vim.cmd.set 'number'
vim.cmd.set 'tabstop=2 shiftwidth=2 expandtab'
vim.cmd.set 'signcolumn=yes'
vim.cmd.set 'list'

-- Python
vim.g.loaded_python3_provider = 1
vim.g.python3_host_prog = "/usr/local/bin/python3"

vim.opt.listchars:append({
  eol = '↵',
  trail = '▒',
  space = '·',
})

-- Syntax highlighting
vim.opt.termguicolors = true
vim.cmd.backgound = 'dark'
vim.cmd.syntax 'enable'
vim.cmd.colorscheme 'deep-space'
vim.cmd.highlight 'Whitespace guifg=#29313f'
vim.cmd.highlight 'NonText guifg=#29313f'
