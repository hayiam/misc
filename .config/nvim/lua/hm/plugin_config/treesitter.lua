require 'nvim-treesitter.configs'.setup {

ensure_installed = {"c", "java", "cpp", "lua", "python", "html", "javascript", "kotlin", "css", "vim"},
ignore_install = {"diff"},

sync_install = false,
auto_install = true,
highlight = {
    enable = true,
    disable = {"diff"},
    },
}
