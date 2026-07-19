-- ============================================
-- Alpha: Pantalla de inicio
-- ============================================

return {
  "goolord/alpha-nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  event = "VimEnter",
  config = function()
    local alpha = require("alpha")
    local dashboard = require("alpha.themes.dashboard")

    -- ASCII art personalizado
    dashboard.section.header.val = {
      [[                                                    ]],
      [[  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗]],
      [[  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║]],
      [[  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║]],
      [[  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║]],
      [[  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║]],
      [[  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝]],
      [[                                                    ]],
      [[              [ m b l a n c @nvim ]                 ]],
      [[                                                    ]],
    }

    -- Botones del menú
    dashboard.section.buttons.val = {
      dashboard.button("f", "  Buscar archivo",      ":Telescope find_files<CR>"),
      dashboard.button("e", "  Nuevo archivo",       ":ene <BAR> startinsert<CR>"),
      dashboard.button("r", "  Archivos recientes",  ":Telescope oldfiles<CR>"),
      dashboard.button("t", "  Buscar texto",        ":Telescope live_grep<CR>"),
      dashboard.button("c", "  Configuración",       ":e ~/.config/nvim/init.lua<CR>"),
      dashboard.button("p", "  Plugins",             ":Lazy<CR>"),
      dashboard.button("q", "  Salir",               ":qa<CR>"),
    }

    -- Pie de página
    dashboard.section.footer.val = {
      "",
      "⚡ Neovim cargado. ¡A programar!",
    }

    -- Configurar colores
    dashboard.section.header.opts.hl = "AlphaHeader"
    dashboard.section.buttons.opts.hl = "AlphaButtons"
    dashboard.section.footer.opts.hl = "AlphaFooter"

    alpha.setup(dashboard.config)
  end,
}
