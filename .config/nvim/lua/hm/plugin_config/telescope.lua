function my_picker(results, title)
  require("telescope.pickers").new({}, {
  prompt_title = title,
  finder = require("telescope.finders").new_table({
  results = results,
  }),
  }):find()
end

local context = false

require("telescope").setup {
  extensions = {
    menu = {
      default = {
        items = {
          -- You can add an item of menu in the form of { "<display>", "<command>" }
          { "Autoformat file", "lua vim.lsp.buf.format { async = true }" },
          { "Change colorscheme", "Telescope colorscheme" },
          { "Change all tabs to spaces", "call ReplaceTabs()" },
          { "Remove trailing spaces", "call StripTrailing()" },
          { "Toggle indent lines", "IndentBlanklineToggle" },
          { "Current context enable/disable", "lua context = not context if context then require('indent_blankline').setup {show_current_context = true} else require('indent_blankline').setup {show_current_context = false} end" },
          { "Add workspace folder", "lua vim.lsp.buf.add_workspace_folder()" },
          { "Remove workspace folder", "lua vim.lsp.buf.remove_workspace_folder()" },
          { "List workspace folders", "lua my_picker(vim.lsp.buf.list_workspace_folders(), 'Workspace folders')" },
          { "Document symbols", "Telescope lsp_document_symbols" },
          { "Workspace symbols", "Telescope lsp_workspace_symbols" },
          { "Dynamic workspace symbols", "Telescope lsp_dynamic_workspace_symbols" },
        },
      },
    },
  },
}

require("telescope").load_extension("menu")
require("telescope").load_extension("fzf")
