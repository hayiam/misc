require("mason").setup()

require("mason-lspconfig").setup({
ensure_installled = { "clangd", "quick_lint_js", "pylsp", "tsserver", "html" },
automatic_installation = true,
})

require("lspconfig").clangd.setup{}
require("lspconfig").quick_lint_js.setup{}
require("lspconfig").pylsp.setup{}
require("lspconfig").tsserver.setup{}
require("lspconfig").html.setup{
    on_attach = function ()
                    -- reset omnicompletion function for html
                    vim.cmd [[set omnifunc=htmlcomplete#CompleteTags]] 
                end,
    settings = { --requires enabling hints by force
        css = {
            lint = {
                validProperties = {},
            },
        },
        html = {
            lint = {
                validProperties = {},
            },
        },
  },
}

-- start with lsp diagnostics disabled
vim.api.nvim_create_autocmd(
    "BufReadPost",
    { pattern = "*", command = "lua vim.diagnostic.disable() diagnostics_active = false" }
)

-- configure diagnostics view
vim.diagnostic.config({
    underline = true,
    update_in_insert = false,
    virtual_text = {
        prefix = '✔', -- Could be '●', '▎', 'x', '■'
  }
})

-- configure floating lsp popups
local _border = "single"

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
    vim.lsp.handlers.hover, {
      border = _border
    }
)

vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(
    vim.lsp.handlers.signature_help, {
      border = _border
    }
)

vim.diagnostic.config{
    float={border=_border}
}
