return {
  {
    'neovim/nvim-lspconfig',
    init = function()
      -- sudo npm install -g typescript typescript-language-server
      require('lspconfig').ts_ls.setup {}
    end,
    keys = {
      { '<leader>d', '<CMD>lua vim.lsp.buf.definition()<CR>', { noremap = true, silent = true }, },
      { '<leader>v', '<CMD>vsplit<CR><CMD>lua vim.lsp.buf.definition()<CR>', { noremap = true, silent = true }, },
      { '<leader>x', '<CMD>split<CR><CMD>lua vim.lsp.buf.definition()<CR>', { noremap = true, silent = true }, },
      { '<leader>a', '<CMD>lua vim.lsp.buf.code_action()<CR>', { noremap = true, silent = true }, },
    },
  },
}
