return {
  {
    'neovim/nvim-lspconfig',
    init = function()
      -- sudo npm install -g typescript typescript-language-server
      require('lspconfig').ts_ls.setup {}
    end,
    keys = {
      { 'grn', '<CMD>lua vim.lsp.buf.rename()<CR>', { noremap = true, silent = true }, },
      { 'gra', '<CMD>lua vim.lsp.buf.code_action()<CR>', { noremap = true, silent = true }, },
      { 'grr', '<CMD>lua vim.lsp.buf.references()<CR>', { noremap = true, silent = true }, },
      { 'gri', '<CMD>lua vim.lsp.buf.implementation()<CR>', { noremap = true, silent = true }, },
    },
  },
}
