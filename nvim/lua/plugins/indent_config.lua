require("ibl").setup({
  indent = {
    char = "│",
  },
  whitespace = {
    remove_blankline_trail = true,
  },
  scope = {
    enabled = true,
    show_start = true,
    show_end = false,
    char = "│",
  },
  exclude = {
    filetypes = {
      "help", "dashboard", "neo-tree", "Trouble",
      "lspinfo", "TelescopePrompt", "alpha", "lazy"
    },
  },
})
