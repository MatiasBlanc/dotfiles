-- ============================================
-- Which-Key: Mostrar atajos disponibles
-- ============================================

return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {
    plugins = {
      marks = true,
      registers = true,
      spelling = {
        enabled = true,
        suggestions = 20,
      },
    },
    win = {
      border = "rounded",
    },
  },
  config = function(_, opts)
    local wk = require("which-key")
    wk.setup(opts)

    -- Registrar grupos de atajos
    wk.add({
      { "<leader>b",  group = "Buffers" },
      { "<leader>d",  group = "Eliminar/Comentar" },
      { "<leader>e",  group = "Explorador" },
      { "<leader>f",  group = "Buscar" },
      { "<leader>g",  group = "Grep" },
      { "<leader>l",  group = "Lazy" },
      { "<leader>p",  group = "Pi Agent" },
      { "<leader>w",  group = "Guardar" },
      { "<leader>q",  group = "Salir" },
      { "<leader>y",  group = "Copiar" },
    })
  end,
}
