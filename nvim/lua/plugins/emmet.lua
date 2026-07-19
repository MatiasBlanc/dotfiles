-- ============================================
-- Emmet: Expansión de abreviaciones HTML/CSS
-- ============================================

return {
  "mattn/emmet-vim",
  ft = { "html", "css", "javascriptreact", "typescriptreact", "vue", "svelte" },
  init = function()
    vim.g.user_emmet_leader_key = "<C-y>"
    vim.g.user_emmet_settings = {
      javascript = {
        extends = "jsx",
      },
      typescript = {
        extends = "tsx",
      },
    },
  end,
}
