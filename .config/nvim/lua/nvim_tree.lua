local function on_nvim_tree_attach(bufnr)
  local api = require "nvim-tree.api"

  local function opts(desc)
    return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end

  api.config.mappings.default_on_attach(bufnr)
  vim.keymap.set('n', '<C-t>', api.tree.change_root_to_parent, opts('Up'))
  vim.keymap.set('n', '?', api.tree.toggle_help, opts('Help'))
end

require('nvim-tree').setup({
  on_attach = on_nvim_tree_attach,
  git = {
    ignore = false,
  },
  renderer = {
    highlight_git = true,
    icons = {
      padding = ' ',
      glyphs = {
        default = '',
        symlink = '*',
        modified = '~',
        folder = {
          default = '+',
          open = '-',
          arrow_closed = '',
          arrow_open = '',
          empty = '',
          empty_open = '',
          symlink = '+',
          symlink_open = '-',
        },
        git = {
          unstaged = '',
          staged = '',
          unmerged = '',
          renamed = '',
          untracked = '',
          deleted = '',
          ignored = '',
        },
      },
    },
  },
})
