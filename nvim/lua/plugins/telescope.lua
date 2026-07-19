-- ============================================
-- Telescope: Buscador fuzzy
-- ============================================

return {
  "nvim-telescope/telescope.nvim",
  branch = "0.1.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    "nvim-tree/nvim-web-devicons",
  },
  cmd = "Telescope",
  keys = {
    { "<leader>f",  ":Telescope find_files<CR>", desc = "Buscar archivos" },
    { "<leader>g",  ":Telescope live_grep<CR>",  desc = "Buscar texto" },
    { "<leader>b",  ":Telescope buffers<CR>",    desc = "Buffers" },
    { "<leader>h",  ":Telescope help_tags<CR>",  desc = "Ayuda" },
    { "<leader>fo", ":Telescope oldfiles<CR>",   desc = "Archivos recientes" },
    { "<leader>fk", ":Telescope keymaps<CR>",    desc = "Keymaps" },
    { "<leader>fc", ":Telescope colorscheme<CR>", desc = "Temas" },
  },
  config = function()
    local telescope = require("telescope")
    local actions = require("telescope.actions")

    telescope.setup({
      defaults = {
        prompt_prefix = "   ",
        selection_caret = "  ",
        path_display = { "truncate" },
        sorting_strategy = "ascending",
        layout_config = {
          horizontal = {
            prompt_position = "top",
            preview_width = 0.55,
          },
          width = 0.87,
          height = 0.80,
        },
        mappings = {
          i = {
            ["<C-j>"] = actions.move_selection_next,
            ["<C-k>"] = actions.move_selection_previous,
            ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
          },
        },
      },
    })

    -- Cargar extensión fzf si está disponible
    pcall(telescope.load_extension, "fzf")
  end,
}
