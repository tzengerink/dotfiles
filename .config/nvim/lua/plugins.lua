-- To install packer run:
--
--   $> git clone --depth 1 https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim
--   $> nvim
--   :PackerInstall
--
return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  use 'nvim-tree/nvim-tree.lua'
  use 'airblade/vim-gitgutter'
  use 'phaazon/hop.nvim'
  use 'prettier/vim-prettier'
  use 'tpope/vim-markdown'

  -- Colorschemes
  use 'tyrannicaltoucan/vim-deep-space'
  use 'EdenEast/nightfox.nvim'
  use 'Mofiqul/vscode.nvim'

  use { 'neoclide/coc.nvim', branch = 'release' }

  use {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.2',
    requires = { {'nvim-lua/plenary.nvim'} }
  }
end)
