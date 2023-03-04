local o = vim.o

o.number=true --show line numbers
o.relativenumber=true --set relative line numbers
o.laststatus=2
--tabulation parametrs
o.shiftwidth=4
o.softtabstop=4
o.tabstop=4
o.smarttab=true --inset tabs on the start of a line acording to shftwidth
o.expandtab=true --tabulations into spaces
o.copyindent=true --copy the previous indentation on autoindenting
o.smartindent=true --setting up smart autoindention
o.syntax="on" --inable syntax hilighting
o.keymap="russian-jcukenwin" --setting up ru mode; ctrl+^ to change keyboard layout
o.iminsert=0
o.imsearch=0
o.ignorecase=true --ignore case while search with /
o.smartcase=true --if search contains an upper case letter it becomes case sensetive
o.timeoutlen=200 o.ttimeoutlen=0 --disable change mode timeout
o.nohlsearch=true --disable highlighting in search mode
o.undofile=true --enable persistent undo option
o.undodir="$HOME/.vim/undo" --set directory to store undo history
o.fileencodings="utf-8,ru" --encodings with which file is written
o.completeopt="menuone,noinsert" --setup omnicompletion
o.shortmess="I" --disable start message
vim.opt.ww:append("[,]") --cross line with <- and -> arrows in insert mode
vim.cmd([[colorscheme tasty]])
--o.colorscheme="dracula"
