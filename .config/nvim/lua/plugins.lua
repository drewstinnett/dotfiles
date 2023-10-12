return require('packer').startup(function(use)
   -- Configurations will go here soon
  use 'wbthomason/packer.nvim'
  use 'shaunsingh/solarized.nvim'

  -- require('plugins')
  require('solarized').set()
end)


