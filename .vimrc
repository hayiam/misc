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
"set up netrw
let g:netrw_banner = 0
let g:netrw_liststyle = 3
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
inoremap <C-r> <C-^>
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
"press Ctrl-space to insert new line in normal mode
nnoremap <C-@> o<Esc>
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
autocmd FileType c,cpp,h,javascript,python inoremap ( ()<C-[>%li
autocmd FileType html inoremap < <><C-[>%li
autocmd FileType html inoremap \ </<C-X><C-O><CR><C-[>x%x$a
autocmd FileType python,c,cpp,h inoremap >>> ->
autocmd FileType html,c,cpp,h,css,javascript,python inoremap { {}<C-[>%li
autocmd FileType html,c,cpp,h,css,javascript,python inoremap {{ {<C-o>o}<C-[>%o
autocmd FileType c,cpp,h,javascript,python inoremap [ []<C-[>%li
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

"setup tabline
function! MyTabLine()
    let s = ''
    " loop through each tab page
    for i in range(tabpagenr('$'))
        if i + 1 == tabpagenr()
            let s .= '%#TabLineSel#'
        else
            let s .= '%#TabLine#'
        endif
        if i + 1 == tabpagenr()
            let s .= '%#TabLineSel#' " WildMenu
        else
            let s .= '%#TabLine#'
        endif
        " set the tab page number (for mouse clicks)
        let s .= '%' . (i + 1) . 'T ['
        " set page number string
        let s .= i + 1 . ']'
        " get buffer names and statuses
        let n = ''  " temp str for buf names
        let m = 0   " &modified counter
        let buflist = tabpagebuflist(i + 1)
        " loop through each buffer in a tab
        for b in buflist
            if getbufvar(b, "&buftype") == 'help'
                let n .= '[H] ' . fnamemodify(bufname(b), ':t:s/.txt$//')
            elseif getbufvar(b, "&buftype") == 'quickfix'
                let n .= '[Q] '
            elseif getbufvar(b, "&modifiable")
                let n .= ' ' . fnamemodify(bufname(b), ':t')" pathshorten(bufname(b))
            endif
            if getbufvar(b, "&modified")
                let m += 1
            endif
        endfor
        " let n .= fnamemodify(bufname(buflist[tabpagewinnr(i + 1) - 1]), ':t')
        let n = substitute(n, ', $', '', '')
        " add modified label
        if m > 0
            let s .= '+'
          " let s .= '[' . m . '+]'
        endif
        if i + 1 == tabpagenr()
            let s .= ' %#TabLineSel#'
        else
            let s .= ' %#TabLine#'
        endif
        " add buffer names
        if n == ''
            let s.= '[New]'
        else
            let s .= n
        endif
        " switch to no underlining and add final space
        let s .= '  '
    endfor
    let s .= '%#TabLineFill#%T'
    " right-aligned close button
        if tabpagenr('$') > 1
            let s .= '%=%#TabLineFill#%999X[x] '
        endif
    return s
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
