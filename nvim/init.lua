require("plugins")
require("opciones")
require("atajos")
require("lazy").setup("plugins")
vim.api.nvim_create_autocmd("User", {
  pattern = "LazyDone",
  callback = function()
    require("lsp_config")
  end
})
vim.opt.clipboard = "unnamedplus"
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Tu tecla 'líder' (usualmente la barra espaciadora) debe ir justo después
vim.g.mapleader = " "
