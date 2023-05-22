-- function to make custom picker
function my_picker(results, rtitle, ptitle, opts)
  require("telescope.pickers").new(opts, {
  results_title = rtitle,
  prompt_title = ptitle,
  finder = require("telescope.finders").new_table({
  results = results,
  }),
  sorter = require("telescope.config").values.generic_sorter(opts),
  }):find()
end

-- function to toggle indent lines
local indent_toggled = false
function toggle_indent_lines()
    toggled = not toggled
    if not require('indent_blankline').enabled and toggled == true then 
        vim.cmd('IndentBlanklineEnable') 
    else 
        vim.cmd('IndentBlanklineDisable') 
    end
end

-- function to toggle indent line context highlight
local context = false
function toggle_context()
  context = not context 
  if context then 
      require('indent_blankline').setup {show_current_context = true} 
  else 
      require('indent_blankline').setup {show_current_context = false} 
  end
end

-- function to toggle highlight of comments
hightlight_changed = false
local comments_color = vim.fn.synIDattr(vim.fn.synIDtrans(vim.fn.hlID("Comment")), "fg#") -- requires Treesitter

toggle_comments_highlight = function()
  hightlight_changed = not hightlight_changed
  if hightlight_changed then
    vim.cmd('highlight Comment ctermfg=green')
  else
    vim.cmd('highlight Comment ctermfg=' .. comments_color)
  end
end


require("telescope").setup {
  extensions = {
    menu = {
      default = {
        items = {
          -- You can add an item of menu in the form of { "<display>", "<command>" }
          { "Add workspace folder", "lua vim.lsp.buf.add_workspace_folder()" },
          { "Autoformat file", "lua vim.lsp.buf.format { async = true }" },
          { "Change all tabs to spaces", "call ReplaceTabs()" },
          { "Change colorscheme", "Telescope colorscheme" },
          { "Current context enable/disable", "lua toggle_context()" },
          { "Document symbols", "Telescope lsp_document_symbols" },
          { "Dynamic workspace symbols", "Telescope lsp_dynamic_workspace_symbols" },
          { "Enable Codeium", "packadd codeium.vim" },
          { "List workspace folders", "lua my_picker(vim.lsp.buf.list_workspace_folders(), 'Folders', 'Workspace folders', require('telescope.themes').get_dropdown{})" },
          { "References", "Telescope lsp_references" },
          { "Remove trailing spaces", "call StripTrailing()" },
          { "Remove workspace folder", "lua vim.lsp.buf.remove_workspace_folder()" },
          { "Toggle comments visability", "lua toggle_comments_highlight()" },
          { "Toggle indent lines", "packadd indent-blankline.nvim | lua toggle_indent_lines()" },
          { "Workspace symbols", "Telescope lsp_workspace_symbols" },
        },
      },
    },
  },
}

require("telescope").load_extension("menu")
require("telescope").load_extension("fzf")
