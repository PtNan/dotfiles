return require('packer').startup(function()
    use 'wbthomason/packer.nvim'
    use 'marko-cerovac/material.nvim'
    use {
        'neoclide/coc.nvim',
        config = function ()
            require 'coc'
        end
    }
    use { 
        'lukas-reineke/indent-blankline.nvim', 
        branch = 'lua'
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
        config = function() require 'my_line' end,
        requires = {'kyazdani42/nvim-web-devicons', opt = true}
    }
end
)
