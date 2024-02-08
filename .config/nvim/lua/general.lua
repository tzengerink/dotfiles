-- Disable netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- General
vim.cmd.set 'number'
vim.cmd.set 'tabstop=2 shiftwidth=2 expandtab'
vim.cmd.set 'signcolumn=yes'
vim.cmd.set 'list'
vim.cmd.set 'cursorline'
vim.cmd.set 'nowrap'

vim.opt.listchars:append({
  eol = '↵',
  trail = '▒',
  space = '·',
})

-- Syntax highlighting
vim.opt.termguicolors = true
vim.cmd.backgound = 'dark'
vim.cmd.syntax 'enable'
vim.cmd.colorscheme 'iceberg'
vim.cmd.highlight 'Whitespace guifg=#2c2c2c'
vim.cmd.highlight 'NonText guifg=#2c2c2c'
vim.cmd.highlight 'Search guibg=#2c2c2c guifg=none'

-- TSServer
-- To setup run:
--
--   $> sudo npm install -g typescript typescript-language-server
--
require('lspconfig').tsserver.setup {}

-- Telescope
require('telescope').setup {
  defaults = {
    file_ignore_patterns = {
      "node_modules",
      "coverage"
    }
  }
}

-- Markdown
vim.cmd([[
  let g:markdown_fenced_languages = ['typescript', 'mermaid']
]])
