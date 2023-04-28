require("mason").setup()

require("mason-lspconfig").setup({
ensure_installled = { "clangd", "quick_lint_js", "pylsp", "html" },
automatic_installation = true,
})

require("lspconfig").clangd.setup{}
require("lspconfig").quick_lint_js.setup{}
require("lspconfig").pylsp.setup{}
require("lspconfig").html.setup{}

-- start with lsp diagnostics disabled
vim.api.nvim_create_autocmd(
  "BufEnter",
  { pattern = "*", command = "lua vim.diagnostic.disable()" }
)
-- configure diagnostics view
vim.diagnostic.config({
    underline = false,
    update_in_insert = false,
    virtual_text = {
        prefix = '■', -- Could be '●', '▎', 'x'
  }
})

--Highlight line number instead of having icons in sign column in lsp diagnostics
vim.cmd([[
highlight! DiagnosticLineNrError guibg=#51202A guifg=#FF0000 gui=bold
highlight! DiagnosticLineNrWarn guibg=#51412A guifg=#FFA500 gui=bold
highlight! DiagnosticLineNrInfo guibg=#1E535D guifg=#00FFFF gui=bold
highlight! DiagnosticLineNrHint guibg=#1E205D guifg=#0000FF gui=bold
sign define DiagnosticSignError text= texthl=DiagnosticSignError linehl= numhl=DiagnosticLineNrError
sign define DiagnosticSignWarn text= texthl=DiagnosticSignWarn linehl= numhl=DiagnosticLineNrWarn
sign define DiagnosticSignInfo text= texthl=DiagnosticSignInfo linehl= numhl=DiagnosticLineNrInfo
sign define DiagnosticSignHint text= texthl=DiagnosticSignHint linehl= numhl=DiagnosticLineNrHint
]])
