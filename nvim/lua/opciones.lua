local opt = vim.opt

opt.mouse = "a"                 -- Activar mouse
opt.number = true               -- Mostrar números de línea
opt.numberwidth = 2             -- Ancho de los números
opt.relativenumber = true       -- Números relativos
opt.encoding = "utf-8"          -- Codificación
opt.showmatch = true            -- Mostrar corchetes coincidentes
opt.shiftwidth = 2              -- Ancho de tabulación
opt.laststatus = 2              -- Mostrar barra de estado
opt.showmode = false            -- Ocultar el modo (-- INSERT --)
opt.title = true                -- Mostrar título
opt.termguicolors = true        -- Colores verdaderos en la terminal

opt.viewdir = vim.fn.expand("~/.config/nvim/folding")

if vim.fn.isdirectory(opt.viewdir:get()) == 0 then
  vim.fn.mkdir(opt.viewdir:get(), "p")
end

vim.opt.clipboard = "unnamedplus"

local fold_group = vim.api.nvim_create_augroup("RememberFolds", { clear = true })
vim.api.nvim_create_autocmd("BufWrite", {
  group = fold_group,
  pattern = "*",
  command = "mkview"
})
vim.api.nvim_create_autocmd("BufRead", {
  group = fold_group,
  pattern = "*",
  command = "silent! loadview"
})
