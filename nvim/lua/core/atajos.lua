-- ============================================
-- Atajos de teclado globales
-- ============================================

local map = vim.keymap.set
local opts = { noremap = true, silent = true }
local remap_opts = { remap = true, silent = true }

-- Leader key
vim.g.mapleader = " "

-- ============================================
-- Navegación básica
-- ============================================

-- Mover líneas seleccionadas
map("v", "J", ":m '>+1<CR>gv=gv", opts)
map("v", "K", ":m '<-2<CR>gv=gv", opts)

-- Mantener cursor centrado al navegar
map("n", "<C-d>", "<C-d>zz", opts)
map("n", "<C-u>", "<C-u>zz", opts)
map("n", "n", "nzzzv", opts)
map("n", "N", "Nzzzv", opts)

-- ============================================
-- Gestión de archivos y ventanas
-- ============================================

-- Guardar y salir
map("n", "<leader>w", ":w<CR>", opts)
map("n", "<leader>q", ":wq<CR>", opts)
map("n", "<C-q>", ":q!<CR>", opts)

-- Recargar configuración
map("n", "<leader>so", ":so %<CR>", opts)

-- Navegación entre ventanas
map("n", "<C-h>", "<C-w>h", opts)
map("n", "<C-j>", "<C-w>j", opts)
map("n", "<C-k>", "<C-w>k", opts)
map("n", "<C-l>", "<C-w>l", opts)

-- Redimensionar ventanas
map("n", "<C-Up>", ":resize +2<CR>", opts)
map("n", "<C-Down>", ":resize -2<CR>", opts)
map("n", "<C-Left>", ":vertical resize -2<CR>", opts)
map("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- ============================================
-- Gestión de Buffers
-- ============================================

map("n", "<leader>bd", ":bdelete<CR>", opts)
map("n", "<S-l>", ":bnext<CR>", opts)
map("n", "<S-h>", ":bprevious<CR>", opts)
map("n", "<leader>bp", ":bprevious<CR>", opts)
map("n", "<leader>bn", ":bnext<CR>", opts)

-- ============================================
-- Plugins (se cargan solo si el plugin existe)
-- ============================================

-- Telescope (búsqueda)
map("n", "<leader>f", ":Telescope find_files<CR>", opts)
map("n", "<leader>g", ":Telescope live_grep<CR>", opts)
map("n", "<leader>b", ":Telescope buffers<CR>", opts)
map("n", "<leader>h", ":Telescope help_tags<CR>", opts)

-- NvimTree (explorador de archivos)
map("n", "<leader>e", ":NvimTreeToggle<CR>", opts)
map("n", "<leader>ef", ":NvimTreeFocus<CR>", opts)

-- ToggleTerm (terminal)
map("n", "<C-\\>", ":ToggleTerm<CR>", opts)
map("t", "<C-\\>", "<C-\\><C-n>:ToggleTerm<CR>", opts)

-- Lazy (gestor de plugins)
map("n", "<leader>l", ":Lazy<CR>", opts)

-- Comment.nvim (comentar/descomentar)
map("n", "<leader>d", "<Plug>(comment_toggle_linewise_current)", remap_opts)
map("v", "<leader>d", "<Plug>(comment_toggle_linewise_visual)", remap_opts)

-- ============================================
-- Autocompletado (nvim-cmp)
-- ============================================

vim.keymap.set("i", "<TAB>", function()
  local cmp = require("cmp")
  if cmp.visible() then
    cmp.select_next_item()
  else
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Tab>", true, false, true), "n", true)
  end
end, { silent = true, desc = "Siguiente item en autocompletado" })

vim.keymap.set("i", "<S-TAB>", function()
  local cmp = require("cmp")
  if cmp.visible() then
    cmp.select_prev_item()
  else
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<S-Tab>", true, false, true), "n", true)
  end
end, { silent = true, desc = "Item anterior en autocompletado" })

-- ============================================
-- Salir del modo insertar/visual
-- ============================================

local escapes = { "jk", "kj", "KJ", "Jk", "Kj" }
for _, key in ipairs(escapes) do
  map("i", key, "<Esc>", opts)
  map("v", key, "<Esc>", opts)
end
map("v", "JK", "<Esc>", opts)

-- ============================================
-- Utilidades
-- ============================================

-- Limpiar búsqueda con Escape
map("n", "<Esc>", ":noh<CR>", opts)

-- Mejor indentación en modo visual
map("v", "<", "<gv", opts)
map("v", ">", ">gv", opts)

-- Pegar sin sobreescribir el clipboard
map("x", "<leader>p", '"_dP', opts)

-- Copiar al clipboard del sistema
map("n", "<leader>y", '"+y', opts)
map("v", "<leader>y", '"+y', opts)
map("n", "<leader>Y", '"+Y', opts)

-- Eliminar sin copiar al clipboard
map("n", "<leader>d", '"_d', opts)
map("v", "<leader>d", '"_d', opts)
