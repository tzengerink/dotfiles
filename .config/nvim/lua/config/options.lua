-- Disable netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Disable providers
vim.g.loaded_node_provider = 0
vim.g.loaded_python3_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.loaded_ruby_provider = 0

-- GENERAL
vim.cmd.set 'number'
vim.cmd.set 'tabstop=2 shiftwidth=2 expandtab'
vim.cmd.set 'signcolumn=yes'
vim.cmd.set 'list'
vim.cmd.set 'cursorline'
vim.cmd.set 'nowrap'
vim.cmd.set 'autoread'
vim.cmd.set 'clipboard=unnamedplus'

vim.opt.listchars:append({
  eol = '↵',
  trail = '▒',
  space = '·',
})

-- SYNTAX HIGHLIGHTING
vim.opt.termguicolors = true
vim.cmd.backgound = 'dark'
vim.cmd.syntax 'enable'
