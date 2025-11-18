return {
  {
    'neoclide/coc.nvim',
    branch = 'release',
    config = function()
      function _G.check_back_space()
        local col = vim.fn.col('.') - 1
        return col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') ~= nil
      end

      local keyset = vim.keymap.set
      local opts = {silent = true, noremap = true, expr = true, replace_keycodes = false}

      keyset("i", "<TAB>", 'coc#pum#visible() ? coc#pum#next(1) : v:lua.check_back_space() ? "<TAB>" : coc#refresh()', opts)
      keyset("i", "<S-TAB>", [[coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"]], opts)

      -- Make <CR> to accept selected completion item or notify coc.nvim to format
      -- <C-g>u breaks current undo, please make your own choice
      keyset("i", "<CR>", [[coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"]], opts)
    end,
  },
  {
    'neovim/nvim-lspconfig',
    enabled = true,
    init = function()
      -- sudo npm install -g typescript typescript-language-server
      vim.lsp.config('ts_ls', {})
      vim.lsp.enable('ts_ls')
    end,
    keys = {
      { 'grn', '<CMD>lua vim.lsp.buf.rename()<CR>', { noremap = true, silent = true }, },
      { 'gra', '<CMD>lua vim.lsp.buf.code_action()<CR>', { noremap = true, silent = true }, },
      { 'grr', '<CMD>lua vim.lsp.buf.references()<CR>', { noremap = true, silent = true }, },
      { 'gri', '<CMD>lua vim.lsp.buf.implementation()<CR>', { noremap = true, silent = true }, },
    },
  },
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      config = require('nvim-treesitter.configs')
      config.setup({
        ensure_installed = {
          "lua",
          "vim",
          "vimdoc",
          "typescript",
          "tsx",
          "javascript",
          "html",
          "markdown",
          "json",
          "bash",
          "gitignore",
          "dockerfile",
        },
        sync_install = false,
        highlight = { enable = true },
        indent = { enable = true },
      });
    end,
  },
  {
    'prettier/vim-prettier',
    config = function()
      vim.cmd([[
        let g:prettier#config#trailing_comma = 'all'
        let g:prettier#exec_cmd_async = 1
        let g:prettier#autoformat = 1
        let g:prettier#autoformat_require_pragma = 0
      ]])
    end
  },
}
