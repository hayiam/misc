local function map(m, k, v)
    vim.keymap.set(m, k, v, { silent = true })
end
--setup ctrl-w to write file
map ("n", "<C-w>", '<CMD>write<CR>')
--setup aliases for ctrl-c and ctrl-v
map ("v", "<C-y>", '"+y')
map ("n", "vv", '"+P')
--remap ctrl+6 (to change keyboard layout) in insert mode
map ("i", "<C-r>", "<C-^>")
--ramap esc
map ("i", "ii", "<C-[>")
map ("v", "ii", "<C-[>")
--remap * cgn for better find and replace word
map ("n", "<C-]>", "*Ncgn")
--omnicompletion shortcuts
map ("i", "<C-o>", "<C-x><C-o>")
--remap movement keys in insert mode
map ("i", "<C-d>", "<Delete>")
map ("i", "<C-h>", "<Left>")
map ("i", "<C-l>", "<Right>")
map ("i", "<C-k>", "<Up>")
map ("i", "<C-j>", "<Down>")
map ("i", "<C-a>", "<Home>")
map ("i", "<C-e>", "<End>")
map ("i", "<C-b>", "<C-o>b")
map ("i", "<C-w>", "<C-o>w")
--press enter to insert new line in normal mode
map ("n", "<C-space>", "o<Esc>")
--setup hotkeys for split mode
--switch between instances
map ("n", "<space>", "<c-w>w")
--open nvim-tree
map ("n", "<space>n", "<CMD>NvimTreeToggle<CR>")
--lsp
-- Global mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
map('n', '<space>f', vim.diagnostic.open_float)
map('n', '[d', vim.diagnostic.goto_prev)
map('n', ']d', vim.diagnostic.goto_next)
map('n', '<space>q', vim.diagnostic.setloclist)

-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    -- Enable completion triggered by <c-x><c-o>
    vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

    -- Buffer local mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local opts = { buffer = ev.buf }
    map('n', 'gD', vim.lsp.buf.declaration, opts)
    map('n', 'gd', vim.lsp.buf.definition, opts)
    map('n', 'K', vim.lsp.buf.hover, opts)
    map('n', 'gi', vim.lsp.buf.implementation, opts)
    map('n', '<C-k>', vim.lsp.buf.signature_help, opts)
    map('n', '<leader>d', vim.lsp.buf.type_definition, opts)
    map({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, opts)
    map('n', 'gr', vim.lsp.buf.references, opts)
    map('n', '<leader>f', function()
      vim.lsp.buf.format { async = true }
    end, opts)
  end,
})
--enable and disable lsp diagnostics
map('n', "<space>e", "<CMD>lua vim.diagnostic.enable()<CR>")
map('n', "<space>d", "<CMD>lua vim.diagnostic.disable()<CR>")
--resize instances
map ("n", "<C-Right>", "<CMD>vertical resize +1<CR>")
map ("n", "<C-Left>", "<CMD>vertical resize -1<CR>")
map ("n", "<C-Down>", "<CMD>resize +1<CR>")
map ("n", "<C-Up>", "<CMD>resize -1<CR>")
--remap keys for functions
map ("n", "<F2>", "<CMD>call StripTrailing()<CR>")
map ("n", "<F3>", "<CMD>call ReplaceTabs()<CR>")
map ("n", "<C-s>", "<CMD>vertical VsplitVifm<CR>")
map ("n", "<C-t>", "<CMD>vertical TabVifm<CR>")
