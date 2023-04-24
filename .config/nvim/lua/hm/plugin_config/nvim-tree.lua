require("nvim-tree").setup({
    disable_netrw = true,
    hijack_netrw = true,
    open_on_tab = true,
    hijack_cursor = true,
    modified = {
        enable = true,
        show_on_dirs = true,
        show_on_open_dirs = true,
    },
    update_focused_file = {
        enable = true,
        update_cwd = true,
    },
    renderer = {
        full_name = false,
        indent_width = 2,
        indent_markers = {
            enable = true,
            inline_arrows = true,
            icons = {
                corner = "└",
                edge = "│",
                item = "│",
                bottom = "─",
                none = " ",
          },
        },
        icons = {
          padding = " ",
          symlink_arrow = " ➛ ",
          show = {
            file = true,
            folder = true,
            folder_arrow = true,
            git = true,
            modified = true,
          },
          glyphs = {
            default = "",
            symlink = "",
            bookmark = "☑",
            modified = "●",
            folder = {
              arrow_closed = "→",
              arrow_open = "↓",
              default = " ",
              open = " ",
              empty = " ",
              empty_open = " ",
              symlink = "☰ ",
              symlink_open = "☰ ",
            },
        },
    },
    },
})


