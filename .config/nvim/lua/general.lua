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
vim.cmd.set 'autoread'

vim.opt.listchars:append({
  eol = '↵',
  trail = '▒',
  space = '·',
})

-- SYNTAX HIGHLIGHTING
vim.opt.termguicolors = true
vim.cmd.backgound = 'dark'
vim.cmd.syntax 'enable'
vim.cmd.colorscheme 'nightfox'
-- Generic adjustments
vim.cmd.highlight 'Whitespace guifg=#333333'
vim.cmd.highlight 'NonText guifg=#333333'
vim.cmd.highlight 'Search guibg=#333333 guifg=none'
vim.cmd.highlight 'LineNR guifg=#666666'
vim.cmd.highlight 'CursorLine guibg=#333333'
vim.cmd.highlight 'StatusLine guibg=#333333'
vim.cmd.highlight 'StatusLineNC guibg=#333333'
vim.cmd.highlight 'WinSeparator guifg=#666666'
-- Transparant background
vim.cmd.highlight 'Normal guibg=none'
vim.cmd.highlight 'NonText guibg=none'
vim.cmd.highlight 'Normal ctermbg=none'
vim.cmd.highlight 'NonText ctermbg=none'
vim.cmd.highlight 'NormalNC guibg=none'

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
      "^./dist/.*",
      "^./node_modules/.*",
      "^./coverage/.*",
    }
  },
}

-- Markdown
vim.cmd([[
  let g:markdown_fenced_languages = ['typescript', 'mermaid']
]])
