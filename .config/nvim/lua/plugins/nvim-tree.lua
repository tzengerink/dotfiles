local function on_nvim_tree_attach(bufnr)
  local api = require "nvim-tree.api"

  local function opts(desc)
    return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end

  api.config.mappings.default_on_attach(bufnr)

  vim.keymap.set('n', '?', api.tree.toggle_help, opts('Help'))

  vim.api.nvim_set_hl(0, "NvimTreeNormal", { link = "Normal" })
  vim.api.nvim_set_hl(0, "NvimTreeFolderName", { link = "NvimTreeFolderIcon" })
  vim.api.nvim_set_hl(0, "NvimTreeOpenedFolderName", { link = "NvimTreeOpenedHL" })
end

return {
  { "nvim-tree/nvim-web-devicons", opts = {} },
  {
    'nvim-tree/nvim-tree.lua',
    opts = {
      on_attach = on_nvim_tree_attach,
      git = { ignore = false },
      view = { width = 60 },
      renderer = { highlight_git = true },
      filters = { dotfiles = true, git_ignored = true },
      sync_root_with_cwd = true,
    },
    keys = {
      { '<C-n>', function() require("nvim-tree.api").tree.toggle({ find_file = true, focus = true }) end, { noremap = true, silent = true } },
    }
  },
}
