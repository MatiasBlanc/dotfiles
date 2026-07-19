-- ============================================
-- Mason: Gestor de LSP servers, linters, etc.
-- ============================================

return {
  "williamboman/mason.nvim",
  cmd = "Mason",
  keys = {
    { "<leader>cm", ":Mason<CR>", desc = "Mason" },
  },
  opts = {
    ensure_installed = {
      -- LSP
      "html",
      "cssls",
      "ts_ls",
      "pyright",
      "lua_ls",
      -- Formatters
      "stylua",
      "black",
      "prettier",
      -- Linters
      "eslint_d",
    },
  },
  config = function(_, opts)
    require("mason").setup(opts)
    -- Auto-install ensure_installed
    local mr = require("mason-registry")
    for _, tool in ipairs(opts.ensure_installed) do
      local p = mr.get_package(tool)
      if not p:is_installed() then
        p:install()
      end
    end
  end,
}
