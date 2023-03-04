require("indent_blankline").setup {
    show_current_context = false,
}

vim.cmd ([[
    let g:indent_blankline_filetype_exclude = ['text']
]])
