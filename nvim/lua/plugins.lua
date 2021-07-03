return require('packer').startup(function()
    use 'wbthomason/packer.nvim'

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
        'lukas-reineke/indent-blankline.nvim',
    }
    use {
        'lewis6991/gitsigns.nvim',
        requires = {'nvim-lua/plenary.nvim'},
        config = function() require 'git' end
    }
    use 'b3nj5m1n/kommentary'
    use 'tpope/vim-repeat'
    use 'justinmk/vim-sneak'
    use {
        'blackCauldron7/surround.nvim',
        config = function()
            require "surround".setup {
                mappings_style = 'surround'
            }
        end
    }
    use 'mg979/vim-visual-multi'
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
        config = function() require 'line_setting' end,
        requires = {'kyazdani42/nvim-web-devicons', opt = true}
    }
    use {
        'marko-cerovac/material.nvim',
        config = function() require 'theme' end
    }
    use 'jiangmiao/auto-pairs'
    use {
        'ray-x/go.nvim',
        config = function() require 'gonvim' end
    }
end
)
