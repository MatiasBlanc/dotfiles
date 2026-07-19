require("nvim-tree").setup({
  view = {
    width = 30,
  },
  renderer = {
    icons = {
      glyphs = {
        default = "",
        symlink = "",
        folder = {
          arrow_closed = "",
          arrow_open = "",
        },
      },
    },
  },
  filters = {
    dotfiles = false,
  },
})
