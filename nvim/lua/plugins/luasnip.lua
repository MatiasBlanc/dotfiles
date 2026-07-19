-- ============================================
-- LuaSnip: Motor de snippets
-- ============================================

return {
  "L3MON4D3/LuaSnip",
  build = "make install_jsregexp",
  dependencies = {
    "rafamadriz/friendly-snippets",
  },
  config = function()
    local luasnip = require("luasnip")

    -- Configuración
    luasnip.config.set_config({
      history = true,
      updateevents = "TextChanged,TextChangedI",
      enable_autosnippets = true,
    })

    -- Cargar snippets personalizados
    require("luasnip.loaders.from_lua").lazy_load({
      paths = vim.fn.stdpath("config") .. "/snippets",
    })

    -- Cargar snippets de VSCode (friendly-snippets)
    require("luasnip.loaders.from_vscode").lazy_load()
  end,
}
