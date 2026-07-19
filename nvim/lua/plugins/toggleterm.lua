-- ============================================
-- ToggleTerm: Terminal integrada
-- ============================================

return {
  "akinsho/toggleterm.nvim",
  version = "*",
  keys = {
    { "<C-\\>", ":ToggleTerm<CR>", desc = "Toggle terminal" },
  },
  cmd = { "ToggleTerm", "TermExec" },
  opts = {
    size = function(term)
      if term.direction == "horizontal" then
        return 15
      elseif term.direction == "vertical" then
        return vim.o.columns * 0.4
      end
    end,
    open_mapping = [[<C-\>]],
    hide_numbers = true,
    shade_filetypes = {},
    shade_terminals = true,
    shading_factor = 2,
    start_in_insert = true,
    insert_mappings = true,
    persist_size = true,
    direction = "float",
    close_on_exit = true,
    shell = vim.o.shell,
    float_opts = {
      border = "curved",
      winblend = 0,
      highlights = {
        border = "Normal",
        background = "Normal",
      },
    },
  },
  config = function(_, opts)
    require("toggleterm").setup(opts)

    -- Función para terminal flotante
    local Terminal = require("toggleterm.terminal").Terminal
    local lazygit = Terminal:new({ cmd = "lazygit", hidden = true, direction = "float" })

    function _LAZYGIT_TOGGLE()
      lazygit:toggle()
    end

    -- Atajos adicionales
    vim.keymap.set("n", "<leader>gg", ":lua _LAZYGIT_TOGGLE()<CR>", { desc = "LazyGit" })
  end,
}
