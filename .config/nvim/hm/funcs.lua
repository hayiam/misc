--make tags and brackets autoclose adn setup vim functions
--autocmd FileType html inoremap <buffer> > ></<C-x><C-o><C-[>0f>a
--autocmd FileType html inoremap <buffer> < <
vim.cmd([[
autocmd FileType c,cpp,h inoremap ( ()<C-[>%li
autocmd FileType html inoremap < <><C-[>%li
autocmd FileType c,cpp,h inoremap >>> ->
autocmd FileType html,c,cpp,h inoremap { {<C-o>o}<C-[>%o
autocmd FileType c,cpp,h inoremap [ []<C-[>%li

function! FindTrailing()
    execute '/\s\+$'
endfunction

function! FindTabs()
    execute '/\t'
endfunction

autocmd cursorhold,bufwritepost * unlet! b:statusline_trailing_space_warning

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

autocmd cursorhold,bufwritepost * unlet! b:statusline_tab_warning

function! StatuslineTabWarning()
    if !exists("b:statusline_tab_warning")
        let b:statusline_tab_warning = ''

        if !&modifiable
            return b:statusline_tab_warning
        endif

        let tabs = search('^\t', 'nw') != 0

        let spaces = search('^ \{' . &ts . ',}[^\t]', 'nw') != 0

        if tabs && spaces
            let b:statusline_tab_warning =  '[mi] '
        else
            let b:statusline_tab_warning = ' '
        endif
    endif
    return b:statusline_tab_warning
endfunction
]])
