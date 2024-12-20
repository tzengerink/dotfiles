-- Disable netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

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
vim.cmd.colorscheme 'duskfox'

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
vim.cmd.highlight 'LineNr guibg=none'
vim.cmd.highlight 'SignColumn guibg=none'

-- TSServer
-- To setup run:
--
--   $> sudo npm install -g typescript typescript-language-server
--
require('lspconfig').ts_ls.setup {}

-- FZF
vim.cmd.set 'rtp+=/usr/local/opt/fzf'
vim.g.fzf_layout = { tmux = "center,90%,90%" }

-- Markdown
vim.cmd([[
  let g:markdown_fenced_languages = ['typescript', 'mermaid']
]])

-- Prettier
vim.cmd([[
  let g:prettier#config#trailing_comma = 'all'
]]);
