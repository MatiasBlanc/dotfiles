-- ============================================
-- NvimTree: Explorador de archivos
-- ============================================

return {
  "nvim-tree/nvim-tree.lua",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  cmd = { "NvimTreeToggle", "NvimTreeFocus" },
  keys = {
    { "<leader>e",  ":NvimTreeToggle<CR>", desc = "Toggle explorador" },
    { "<leader>ef", ":NvimTreeFocus<CR>",  desc = "Focus explorador" },
  },
  opts = {
    view = {
      width = 30,
      side = "left",
    },
    renderer = {
      icons = {
        show = {
          file = true,
          folder = true,
          folder_arrow = true,
          git = true,
        },
        glyphs = {
          default = "",
          symlink = "",
          folder = {
            arrow_closed = "",
            arrow_open = "",
            default = "",
            open = "",
            empty = "",
            empty_open = "",
          },
          git = {
            unstaged = "✗",
            staged = "✓",
            untracked = "★",
            renamed = "➜",
            deleted = "✖",
            ignored = "◌",
          },
        },
      },
    },
    filters = {
      dotfiles = false,
      custom = { "^.git$" },
    },
    git = {
      enable = true,
      ignore = false,
    },
    actions = {
      open_file = {
        quit_on_open = false,
        resize_window = true,
      },
    },
  },
}
