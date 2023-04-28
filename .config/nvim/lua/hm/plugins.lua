return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'
    use 'nvim-treesitter/nvim-treesitter'
    use 'vifm/vifm.vim'
    use 'lukas-reineke/indent-blankline.nvim'
    use 'ggandor/lightspeed.nvim'
    use 'nvim-tree/nvim-tree.lua'
    use {
        "williamboman/mason.nvim",
        build = ":MasonUpdate", -- :MasonUpdate updates registry contents
    }
    use {
        "williamboman/mason-lspconfig.nvim",
        "neovim/nvim-lspconfig",
    }
end)
