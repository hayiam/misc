local function map(m, k, v)
    vim.keymap.set(m, k, v, { silent = true })
end

--setup ctrl-w to write file
map ("n", "<C-w>", "<CMD>write<CR>")
--setup aliases for ctrl-c and ctrl-v
map ("v", "<C-y>", '"+y')
map ("n", "vv", '"+P')
--remap ctrl+6 (to change keyboard layout) in insert mode
map ("i", "<C-r>", "<C-^>")
--ramap esc
map ("i", "ii", "<C-[>")
map ("v", "ii", "<C-[>")
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
--open nvim-tree
map ("n", "<space>n", "<CMD>NvimTreeToggle<CR>")

--lsp
-- Global mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
map("n", "<space>q", vim.diagnostic.open_float)
map("n", "<", vim.diagnostic.goto_prev)
map("n", ">", vim.diagnostic.goto_next)
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
    map("n", "gD", vim.lsp.buf.declaration, opts)
    map("n", "gd", vim.lsp.buf.definition, opts)
    map("n", "<space>r", vim.lsp.buf.rename, opts)
    map("n", "K", vim.lsp.buf.hover, opts)
    map("n", "gi", vim.lsp.buf.implementation, opts)
    map("n", "<C-k>", vim.lsp.buf.signature_help, opts)
    map({ "n", "v" }, "<C-c>", vim.lsp.buf.code_action, opts)
    map("n", "gr", vim.lsp.buf.references, opts)
  end,
})

--toggle lsp diagnostics
map("n", "<leader>e", vim.diagnostic.enable)
map("n", "<leader>d", vim.diagnostic.disable)

-- Find files using Telescope command-line sugar.
local builtin = require('telescope.builtin')
map("n", "<space>f", builtin.find_files)
map("n", "<space>g", builtin.live_grep)
map("n", "<space>b", builtin.buffers)
map("n", "<space>h", builtin.help_tags)
map("n", "<space>d", builtin.diagnostics)
map("n", "<space>m", "<CMD>Telescope menu<CR>")

--setup hotkeys for split mode
--switch between instances
map ("n", "<space>", "<c-w>w")
--resize instances
map ("n", "<C-Right>", "<CMD>vertical resize +1<CR>")
map ("n", "<C-Left>", "<CMD>vertical resize -1<CR>")
map ("n", "<C-Down>", "<CMD>resize +1<CR>")
map ("n", "<C-Up>", "<CMD>resize -1<CR>")
--remap keys for functions
map ("n", "<C-s>", "<CMD>vertical VsplitVifm<CR>")
map ("n", "<C-t>", "<CMD>vertical TabVifm<CR>")
