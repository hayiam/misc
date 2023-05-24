" Version:      1.0
" License:      MIT
hi clear
if exists("syntax_on")
  syntax reset
endif

let g:colors_name = "woju"

" User Options
if !exists("g:vim_woju_italic")
    let g:vim_woju_italic = 0
endif

if g:vim_woju_italic
  let s:italic = { "cterm": "italic", "gui": "italic" }
else
  let s:italic = { "cterm": "NONE", "gui": "NONE" }
endif



let s:none = { "cterm": "NONE", "gui": "NONE" }
let s:bold = { "cterm": "bold", "gui": "bold" }
let s:reverse = { "cterm": "reverse", "gui": "bold" }
let s:underline = { "cterm": "underline", "gui": "underline" }
let s:bold_underline = { "cterm": "bold,underline", "gui": "bold,underline" }

let s:white = { "cterm": 15, "gui": "#ffffff" }
let s:black = { "cterm": 16, "gui": "#000000" }
let s:pink = { "cterm": 175, "gui": "#d787af" }
let s:steel_blue = { "cterm": 75, "gui": "#5fafff" }
let s:sky_blue = { "cterm": 111, "gui": "#87afff" }
let s:green = { "cterm": 49, "gui": "#00ffaf" }
let s:dark_green = { "cterm": 22, "gui": "#005f00" }
let s:light_green = { "cterm": 112, "gui": "#87d700" }
let s:light_blue = { "cterm": 117, "gui": "#87d7ff" }
let s:purple = { "cterm": 140, "gui": "#af87d7" }
let s:light_yellow = { "cterm": 184, "gui": "#d7d700" }
let s:red = { "cterm": 203, "gui": "#ff5f5f" }
let s:yellow = { "cterm": 220, "gui": "#ffd700" }
let s:charcoal = { "cterm": 235, "gui": "#262626" }
let s:darker_grey = { "cterm": 237, "gui": "#3a3a3a" }
let s:grey = { "cterm": 239, "gui": "#4e4e4e" }
let s:light_grey = { "cterm": 240, "gui": "#585858" }
let s:lighter_grey = { "cterm": 242, "gui": "#6c6c6c" }
let s:bright_grey = { "cterm": 252, "gui": "#d0d0d0" }
let s:steel_grey = { "cterm": 245, "gui": "#8a8a8a" }

function! Highlight(group, fg, bg, style)
  exec "hi " . a:group
        \ . " ctermfg=" . a:fg["cterm"]
        \ . " ctermbg=" . a:bg["cterm"]
        \ . " cterm=" . a:style["cterm"]
        \ . " guifg=" . a:fg["gui"]
        \ . " guibg=" . a:bg["gui"]
        \ . " gui=" . a:style["gui"]
endfunction

"custom highlights for statusbar
call Highlight("NormalMode", s:charcoal, s:light_blue, s:bold)
call Highlight("InsertMode", s:charcoal, s:light_green, s:bold)
call Highlight("RPlaceMode", s:white, s:red, s:bold)
call Highlight("VisualMode", s:charcoal, s:purple, s:bold)
call Highlight("Encoding", s:yellow, s:darker_grey, s:none)
call Highlight("StatusLine", s:yellow, s:none, s:none)
call Highlight("StatusLineNC", s:yellow, s:darker_grey, s:none)
call Highlight("SeparatorLine", s:none, s:charcoal, s:none)
call Highlight("WinSeparator", s:grey, s:none, s:none)

" NvimTree colors
call Highlight("NvimTreeFileIcon", s:light_blue, s:charcoal, s:none)
call Highlight("NvimTreeRootFolder", s:purple, s:charcoal, s:none)
call Highlight("NvimTreeFolderIcon", s:light_green, s:charcoal, s:none)
call Highlight("NvimTreeIndentMarker", s:light_grey, s:charcoal, s:none)
call Highlight("NvimTreeModifiedFile", s:red, s:charcoal, s:none)
call Highlight("NvimTreeLspDiagnosticsError", s:pink, s:charcoal, s:bold)
call Highlight("NvimTreeLspDiagnosticsWarning", s:light_grey, s:charcoal, s:none)
call Highlight("NvimTreeLspDiagnosticsInformation", s:yellow, s:charcoal, s:none)
call Highlight("NvimTreeLspDiagnosticsHint", s:green, s:charcoal, s:none)

" Lsp diagnostics colors
call Highlight("DiagnosticLineNrError", s:pink, s:charcoal, s:bold)
call Highlight("DiagnosticLineNrWarn", s:bright_grey, s:charcoal, s:bold)
call Highlight("DiagnosticLineNrInfo", s:yellow, s:charcoal, s:none)
call Highlight("DiagnosticLineNrHint", s:green, s:charcoal, s:none)
call Highlight("DiagnosticVirtualTextError", s:pink, s:charcoal, s:bold)
call Highlight("DiagnosticVirtualTextWarn", s:bright_grey, s:charcoal, s:none)
call Highlight("DiagnosticVirtualTextInfo", s:yellow, s:charcoal, s:none)
call Highlight("DiagnosticVirtualTextHint", s:green, s:charcoal, s:none)
call Highlight("DiagnosticFloatingError", s:red, s:none, s:bold)
call Highlight("DiagnosticFloatingWarn", s:bright_grey, s:none, s:bold)
call Highlight("DiagnosticFloatingInfo", s:yellow, s:none, s:bold)
call Highlight("DiagnosticFloatingHint", s:green, s:none, s:bold)
call Highlight("DiagnosticUnderLineError", s:pink, s:none, s:bold)
call Highlight("DiagnosticUnderLineWarn", s:bright_grey, s:none, s:none)
call Highlight("DiagnosticUnderLineInfo", s:yellow, s:none, s:none)
call Highlight("DiagnosticUnderLineHint", s:green, s:none, s:none)

call Highlight("IndentBlankLineChar", s:light_grey, s:none, s:none)
call Highlight("IndentBlankLineContextChar", s:bright_grey, s:none, s:none)

" Highlight line number instead of having icons sign column in lsp diagnostics
sign define DiagnosticSignError text= texthl=DiagnosticSignError linehl= numhl=DiagnosticLineNrError
sign define DiagnosticSignWarn text= texthl=DiagnosticSignWarn linehl= numhl=DiagnosticLineNrWarn
sign define DiagnosticSignInfo text= texthl=DiagnosticSignInfo linehl= numhl=DiagnosticLineNrInfo
sign define DiagnosticSignHint text= texthl=DiagnosticSignHint linehl= numhl=DiagnosticLineNrHint

call Highlight("TabLine", s:light_yellow, s:none, s:none)
call Highlight("TabLineSel", s:light_yellow, s:none, s:underline)
call Highlight("TabLineFill", s:light_yellow, s:none, s:none)

call Highlight("Comment", s:steel_grey, s:none, s:italic)

call Highlight("Folded", s:sky_blue, s:none, s:none)
call Highlight("FoldColumn", s:sky_blue, s:none, s:none)

call Highlight("PreProc", s:steel_blue, s:none, s:bold)
call Highlight("Statement", s:yellow, s:none, s:bold)
call Highlight("Constant", s:purple, s:none, s:none)
call Highlight("Type", s:light_green, s:none, s:bold)
call Highlight("Function", s:light_blue, s:none, s:none)
call Highlight("Identifier", s:light_blue, s:none, s:bold)

call Highlight("Special", s:red, s:none, s:bold)
call Highlight("Delimiter", s:red, s:none, s:none)
call Highlight("Todo", s:red, s:none, s:bold)

call Highlight("ColorColumn", s:none, s:charcoal, s:none)
call Highlight("CursorColumn", s:none, s:charcoal, s:none)
call Highlight("CursorLine", s:none, s:charcoal, s:none)

call Highlight("CursorLineNr", s:light_yellow, s:none, s:none)
call Highlight("LineNr", s:light_grey, s:none, s:none)
call Highlight("Visual", s:none, s:darker_grey, s:none)

call Highlight("Pmenu", s:bright_grey, s:charcoal, s:none)
call Highlight("PmenuSel", s:yellow, s:grey, s:none)
call Highlight("PmenuSbar", s:none, s:green, s:none)
call Highlight("PmenuThumb", s:light_blue, s:white, s:none)

call Highlight("WildMenu", s:black, s:yellow, s:none)

call Highlight("Search", s:none, s:none, s:reverse)
call Highlight("IncSearch", s:none, s:none, s:reverse)

call Highlight("DiffAdd", s:none, s:dark_green, s:none)
call Highlight("diffAdded", s:green, s:none, s:none)
call Highlight("DiffDelete", s:pink, s:pink, s:none)
call Highlight("DiffChange", s:none, s:charcoal, s:none)
call Highlight("DiffText", s:none, s:charcoal, s:none)


set background=dark
