set number "show line numbers
set relativenumber "set relative line numbers
set laststatus=2
"tabulation parametrs
set shiftwidth=4
set softtabstop=4
set tabstop=4
set smarttab "inset tabs on the start of a line acording to shftwidth
set expandtab "tabulations into spaces
"set autoindent "setting up autoindent mode
set copyindent "copy the previous indentation on autoindenting
set smartindent "setting up smart autoindention
syntax on "inable syntax hilighting
set keymap=russian-jcukenwin "setting up ru mode; ctrl+l in insert mode to change keyboard layout
set iminsert=0
set imsearch=0
set ignorecase "ignore case while search with /
set smartcase "if search contains an upper case letter it becomes case sensetive
set timeoutlen=200 ttimeoutlen=0 "disable change mode timeout
set nohlsearch "disable highlighting in search mode
set undofile "enable persistent undo option
set undodir=$HOME/.vim/undo "set directory to store undo history
set fileencodings=utf-8,ru "encodings with which file is written
set completeopt=menuone,noinsert "setup omnicompletion
set shortmess=I "disable start message
set ww+=[,] "cross line with <- and -> arrows in insert mode 
colorscheme tasty
"colorscheme dracula
"set up statusline
set statusline=
set statusline+=%#NormalMode#%{(mode()=='n')?'\ \ NORMAL\ ':''}
set statusline+=%#InsertMode#%{(mode()=='i')?'\ \ INSERT\ ':''}
set statusline+=%#RPlaceMode#%{(mode()=='r')?'\ \ RPLACE\ ':''}
set statusline+=%#VisualMode#%{(mode()=='v')?'\ \ VISUAL\ ':''}
set statusline+=%#StatusLine#
set statusline+=\ %t
set statusline+=%r
set statusline+=%m
set statusline+=%=
set statusline+=%#StatusLineNC#
set statusline+=\ %p%%
set statusline+=\ %l:%c\ 
"display a warning if &et is wrong, or we have mixed-indenting or trailing whitespaces
set statusline+=%#StatusLineNC#
set statusline+=%{StatuslineTabWarning()}
set statusline+=%{StatuslineTrailingSpaceWarning()}
set statusline+=%#SeparatorLine#
set statusline+=\ 
set statusline+=%#Encoding#
set statusline+=\ %y
set statusline+=\ %{&fileencoding?&fileencoding:&encoding}
set statusline+=\[%{&fileformat}\]
set statusline+=\ 
set statusline+=%#SeparatorLine#
set statusline+=\ 
"setup aliases for ctrl-c and ctrl-v
vnoremap <C-y> "+y
nnoremap vv "+P
"remap ctrl+6 (to change keyboard layout) in insert mode
inoremap <C-l> <C-^>
"ramap esc
inoremap ii <C-[>
vnoremap ii <C-[>
"remap * cgn for better find and replace word
noremap <C-]> *Ncgn
"omnicompletion shortcuts
inoremap <C-o> <C-x><C-o>
"remap movement keys in insert mode
inoremap <C-d> <Delete>
inoremap <C-h> <Left>
inoremap <C-l> <Right>
inoremap <C-k> <Up>
inoremap <C-j> <Down>
inoremap <C-a> <Home>
inoremap <C-e> <End>
inoremap <C-b> <C-o>b
inoremap <C-w> <C-o>w
"press enter to insert new line in normal mode
nnoremap <CR> o<Esc>
"setup hotkeys for split mode
"switch between instances
nnoremap <space> <c-w>w
"resize instances
noremap <silent> <C-Right> :vertical resize +1<CR>
noremap <silent> <C-Left> :vertical resize -1<CR>
noremap <silent> <C-Down> :resize +1<CR>
noremap <silent> <C-Up> :resize -1<CR>
"remap keys for functions
nmap <F4> :call FindTrailing()<CR>
nmap <F3> :call FindTabs()<CR>
"make tags and brackets autoclose
"autocmd FileType html inoremap <buffer> > ></<C-x><C-o><C-[>0f>a
"autocmd FileType html inoremap <buffer> < <
autocmd FileType c,cpp,h inoremap ( ()<C-[>%li
autocmd FileType html inoremap < <><C-[>%li
autocmd FileType c,cpp,h inoremap >>> ->
autocmd FileType html,c,cpp,h inoremap { {<C-o>o}<C-[>%o
autocmd FileType c,cpp,h inoremap [ []<C-[>%li
"inoremap { {}<C-[>%li
"inoremap < <><C-[>i

"functions

"regex functions
"find trailing whitespaces
function! FindTrailing()
    execute '/\s\+$'
endfunction

"find all tabs
function! FindTabs()
    execute '/\t'
endfunction

"functions for status line
"recalculate the trailing whitespace warning when idle, and after saving
autocmd cursorhold,bufwritepost * unlet! b:statusline_trailing_space_warning

"return '[tr]' if trailing white space is detected
"return '' otherwise
function! StatuslineTrailingSpaceWarning()
    if !exists("b:statusline_trailing_space_warning")

        if !&modifiable
            let b:statusline_trailing_space_warning = ''
            return b:statusline_trailing_space_warning
        endif

        if search('\s\+$', 'nw') != 0
            let b:statusline_trailing_space_warning = '[tr] '
        else
            let b:statusline_trailing_space_warning = ''
        endif
    endif
    return b:statusline_trailing_space_warning
endfunction

"recalculate the tab warning flag when idle and after writing
autocmd cursorhold,bufwritepost * unlet! b:statusline_tab_warning

"return '[et]' if &et is set wrong
"return '[mi]' if spaces and tabs are used to indent
"return an empty string if everything is fine
function! StatuslineTabWarning()
    if !exists("b:statusline_tab_warning")
        let b:statusline_tab_warning = ''

        if !&modifiable
            return b:statusline_tab_warning
        endif

        let tabs = search('^\t', 'nw') != 0

        "find spaces that arent used as alignment in the first indent column
        let spaces = search('^ \{' . &ts . ',}[^\t]', 'nw') != 0

        if tabs && spaces
            let b:statusline_tab_warning =  '[mi] '
        else
            let b:statusline_tab_warning = ' '
        endif
    endif
    return b:statusline_tab_warning
endfunction
