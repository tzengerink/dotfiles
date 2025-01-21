return {
  {
    'junegunn/fzf',
    keys = {
      { '<Leader>f', ':Files<CR>', { noremap = true, silent = true } },
      { '<Leader>b', ':Buffer<CR>', { noremap = true, silent = true } },
      { '<Leader>r', ':RG<CR>', { noremap = true, silent = true } },
      { '<Leader>g', ':GF?<CR>', { noremap = true, silent = true } },
      { '<Leader>h', ':History<CR>', { noremap = true, silent = true } },
      { '<Leader>;', ':History:<CR>', { noremap = true, silent = true } },
      { '<Leader>l', ':BLines<CR>', { noremap = true, silent = true } },
    },
    config = function()
      vim.cmd.set 'rtp+=/usr/local/opt/fzf'
      vim.g.fzf_layout = { window = { width = 0.9, height = 0.9 } }
    end
  },
  { 'junegunn/fzf.vim' },
}
