local function map(m, k, v)
	vim.keymap.set(m, k, v, { silent = true })
end
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
map ("n", "<CR>", "o<Esc>")
--setup hotkeys for split mode
--switch between instances
map ("n", "<space>", "<c-w>w")
--resize instances
map ("n", "<C-Right>", "<CMD>vertical resize +1<CR>")
map ("n", "<C-Left>", "<CMD>vertical resize -1<CR>")
map ("n", "<C-Down>", "<CMD>resize +1<CR>")
map ("n", "<C-Up>", "<CMD>resize -1<CR>")
--remap keys for functions
map ("n", "<F4>", "<CMD>call FindTrailing()<CR>")
map ("n", "<F3>", "<CMD>call FindTabs()<CR>")
map ("n", "<C-s>", "<CMD>vertical VsplitVifm<CR>")
map ("n", "<C-t>", "<CMD>vertical TabVifm<CR>")
