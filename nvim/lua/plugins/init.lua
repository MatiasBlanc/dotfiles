-- ============================================
-- Plugins: Lista principal (lazy.nvim)
-- ============================================
-- Cada plugin tiene su archivo de configuración separado
-- lazy.nvim carga automáticamente los archivos en lua/plugins/*.lua

return {
  -- ========================================
  -- UI y Temas
  -- ========================================
  require("plugins.tokyonight"),
  require("plugins.alpha"),
  require("plugins.lualine"),
  require("plugins.bufferline"),
  require("plugins.nvimtree"),
  require("plugins.indent"),
  require("plugins.which-key"),

  -- ========================================
  -- LSP y Autocompletado
  -- ========================================
  require("plugins.mason"),
  require("plugins.lspconfig"),
  require("plugins.cmp"),

  -- ========================================
  -- Formateo y Linting
  -- ========================================
  require("plugins.conform"),
  require("plugins.treesitter"),

  -- ========================================
  -- Herramientas
  -- ========================================
  require("plugins.telescope"),
  require("plugins.gitsigns"),
  require("plugins.autopairs"),
  require("plugins.comment"),
  require("plugins.toggleterm"),
  require("plugins.luasnip"),

  -- ========================================
  -- Desarrollo
  -- ========================================
  require("plugins.emmet"),
  require("plugins.friendly-snippets"),
}
