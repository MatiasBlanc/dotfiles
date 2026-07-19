-- ============================================
-- LSP Config: Configuración de servidores LSP
-- ============================================

return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "hrsh7th/cmp-nvim-lsp",
  },
  config = function()
    local lspconfig = require("lspconfig")
    local capabilities = require("cmp_nvim_lsp").default_capabilities()

    -- Diagnósticos
    vim.diagnostic.config({
      virtual_text = {
        prefix = "●",
        source = "always",
      },
      float = {
        source = "always",
        border = "rounded",
      },
      signs = true,
      underline = true,
      update_in_insert = false,
    })

    -- Iconos de diagnósticos
    local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
    for type, icon in pairs(signs) do
      local hl = "DiagnosticSign" .. type
      vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
    end

    -- On attach: keymaps para LSP
    local on_attach = function(client, bufnr)
      local map = function(keys, func, desc)
        vim.keymap.set("n", keys, func, { buffer = bufnr, desc = "LSP: " .. desc })
      end

      map("gd", vim.lsp.buf.definition, "Ir a definición")
      map("gD", vim.lsp.buf.declaration, "Ir a declaración")
      map("gr", vim.lsp.buf.references, "Ver referencias")
      map("gi", vim.lsp.buf.implementation, "Ir a implementación")
      map("K", vim.lsp.buf.hover, "Mostrar documentación")
      map("<leader>ca", vim.lsp.buf.code_action, "Acciones de código")
      map("<leader>rn", vim.lsp.buf.rename, "Renombrar")
      map("<leader>D", vim.lsp.buf.type_definition, "Definición de tipo")
      map("[d", vim.diagnostic.goto_prev, "Diagnóstico anterior")
      map("]d", vim.diagnostic.goto_next, "Diagnóstico siguiente")
      map("<leader>dl", vim.diagnostic.open_float, "Mostrar diagnóstico")
    end

    -- Servidores LSP
    local servers = {
      html = {},
      cssls = {},
      ts_ls = {},
      pyright = {
        settings = {
          python = {
            analysis = {
              typeCheckingMode = "basic",
              autoSearchPaths = true,
              useLibraryCodeForTypes = true,
            },
          },
        },
      },
      lua_ls = {
        settings = {
          Lua = {
            runtime = { version = "LuaJIT" },
            workspace = {
              checkThirdParty = false,
              library = { vim.env.VIMRUNTIME },
            },
            telemetry = { enable = false },
            diagnostics = { globals = { "vim" } },
          },
        },
      },
    }

    -- Configurar cada servidor
    for server, config in pairs(servers) do
      lspconfig[server].setup(vim.tbl_deep_extend("force", {
        capabilities = capabilities,
        on_attach = on_attach,
      }, config))
    end
  end,
}
