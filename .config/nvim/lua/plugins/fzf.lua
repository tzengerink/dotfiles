return {
  {
    'junegunn/fzf',
    lazy = false,
    keys = {
      { '<Leader>f', ':Files<CR>', { noremap = true, silent = true } },
      { '<Leader>b', ':Buffers<CR>', { noremap = true, silent = true } },
      { '<Leader>r', ':RG<CR>', { noremap = true, silent = true } },
      { '<Leader>g', ':GF?<CR>', { noremap = true, silent = true } },
      { '<Leader>h', ':History<CR>', { noremap = true, silent = true } },
      { '<Leader>j', ':Jumps<CR>', { noremap = true, silent = true } },
      { '<Leader>;', ':History:<CR>', { noremap = true, silent = true } },
    },
    config = function()
      vim.cmd.set 'rtp+=/usr/local/opt/fzf'
      vim.g.fzf_layout = { down = '100%' }
    end
  },
  { 'junegunn/fzf.vim' },
}
