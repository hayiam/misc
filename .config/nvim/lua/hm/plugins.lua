return require('packer').startup(function(use)
    use "wbthomason/packer.nvim"
    use "nvim-treesitter/nvim-treesitter"
    use "vifm/vifm.vim"
    use {
        "lukas-reineke/indent-blankline.nvim",
        opt = true
    }
    use "nvim-tree/nvim-tree.lua"
    use "ggandor/lightspeed.nvim"  
    use "aznhe21/actions-preview.nvim"
    use {
        "NvChad/nvim-colorizer.lua",
        opt = true
    }
    use {
        "Exafunction/codeium.vim",
        opt = true
    }
    
   -- Lsp
    use {
        "williamboman/mason.nvim",
        build = ":MasonUpdate", -- updates registry contents
    }
    use {
        "williamboman/mason-lspconfig.nvim",
        "neovim/nvim-lspconfig",
    }

    -- Telescope
    use {
        "nvim-telescope/telescope.nvim",
        requires = { {"nvim-lua/plenary.nvim"} }
    }
    use {
        "nvim-telescope/telescope-fzf-native.nvim", 
        run = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build"
    }
    use "octarect/telescope-menu.nvim"
end)
