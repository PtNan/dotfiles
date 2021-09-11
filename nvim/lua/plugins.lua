local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path})
  execute 'packadd packer.nvim'
end

require 'global'
return require('packer').startup(function()
    use 'wbthomason/packer.nvim'
    use 'lukas-reineke/indent-blankline.nvim'
    use 'b3nj5m1n/kommentary'
    use 'tpope/vim-repeat'
    use 'justinmk/vim-sneak'
    use 'mg979/vim-visual-multi'
    use 'jiangmiao/auto-pairs'
    use 'glepnir/zephyr-nvim'
    use 'kyazdani42/nvim-web-devicons'

    use {
        'neovim/nvim-lspconfig',
        config = function() require 'lsp' end
    }

    use {
        'hrsh7th/nvim-compe',
        config = function() require 'compe_setting' end
    }

    use {
        'nvim-telescope/telescope.nvim',
        requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}},
        config = function() require 'telescope_setting' end
    }

    use {
        'lewis6991/gitsigns.nvim',
        requires = {'nvim-lua/plenary.nvim'},
        config = function() require 'git' end
    }
    use {
        'blackCauldron7/surround.nvim',
        config = function()
            require "surround".setup {
                mappings_style = 'surround'
            }
        end
    }
    use { 
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate',
        config = function() require 'treesitter' end
    }
    use {
        'kyazdani42/nvim-tree.lua',
        config = function() require 'nvimtree' end
    }
    use {
        'glepnir/galaxyline.nvim',
        config = function() require 'line_setting' end
    }
    use {
        'ray-x/go.nvim',
        config = function() require 'gonvim' end
    }
end
)
