return {
  {
    'junegunn/fzf',
    lazy = false,
    keys = {
      { '<LEADER>f', ':Files<CR>', { noremap = true, silent = true } },
      { '<LEADER>b', ':Buffers<CR>', { noremap = true, silent = true } },
      { '<LEADER>r', ':RG<CR>', { noremap = true, silent = true } },
      { '<LEADER>gf', ':GF?<CR>', { noremap = true, silent = true } },
      { '<LEADER>h', ':History<CR>', { noremap = true, silent = true } },
      { '<LEADER>j', ':Jumps<CR>', { noremap = true, silent = true } },
      { '<LEADER>m', ':Marks<CR>', { noremap = true, silent = true } },
      { '<LEADER>;', ':History:<CR>', { noremap = true, silent = true } },
    },
    config = function()
      vim.cmd.set 'rtp+=/usr/local/opt/fzf'
      vim.g.fzf_layout = {
        window = {
          width = 0.95,
          height = 0.95,
          border = 'rounded',
        }
      }
    end
  },
  { 'junegunn/fzf.vim' },
}
