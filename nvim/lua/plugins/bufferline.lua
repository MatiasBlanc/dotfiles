-- ============================================
-- Bufferline: Pestañas de buffers
-- ============================================

return {
  "akinsho/bufferline.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  version = "*",
  event = "VeryLazy",
  opts = {
    options = {
      mode = "buffers",
      diagnostics = "nvim_lsp",
      separator_style = "slant",
      show_close_icon = false,
      show_buffer_close_icons = true,
      always_show_bufferline = true,
      offsets = {
        {
          filetype = "NvimTree",
          text = "Explorador",
          highlight = "Directory",
          separator = true,
        },
      },
    },
  },
}
