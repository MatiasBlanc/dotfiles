vim.g.mapleader = " "

local map = vim.keymap.set
local opts = { noremap = true, silent = true }
local remap_opts = { remap = true, silent = true }

-- Comandos básicos
map("n", "<C-q>", ":q!<cr>", opts)
map("n", "<leader>q", ":wq<cr>", opts)
map("n", "<leader>w", ":w<cr>", opts)
map("n", "<leader>so", ":so %<cr>", opts)

-- Plugins (Telescope para búsqueda, Lazy para gestionar plugins)
map("n", "<leader>f", ":Telescope find_files<cr>", opts)
map("n", "<leader>g", ":Telescope live_grep<cr>", opts)
map("n", "<leader>l", ":Lazy<cr>", opts)
map("n", "<leader>n", ":NvimTreeToggle<cr>", opts)
map("n", "<C-\\>", ":ToggleTerm<cr>", opts)
map("n", "<leader>d", "<Plug>(comment_toggle_linewise_current)<cr>", remap_opts)
map("v", "<leader>d", "<Plug>(comment_toggle_linewise_visual)<cr>", remap_opts)

-- Manejo de Buffers
map("n", "<leader>bd", ":bdelete<cr>", opts)
map("n", "<leader>v", ":bprevious<cr>", opts)
map("n", "<leader>b", ":bnext<cr>", opts)
map("n", "<C-1>", ":b1<cr>", opts)

-- Autocompletado con Tab
vim.keymap.set("i", "<TAB>", function()
  local cmp = require('cmp')
  if cmp.visible() then
    cmp.select_next_item()
  else
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Tab>", true, false, true), "n", true)
  end
end, { silent = true })

vim.keymap.set("i", "<S-TAB>", function()
  local cmp = require('cmp')
  if cmp.visible() then
    cmp.select_prev_item()
  else
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<S-Tab>", true, false, true), "n", true)
  end
end, { silent = true })

-- Salir del modo insertar/visual con variaciones de 'jk'
local escapes = { "jk", "kj", "KJ", "Jk", "Kj" }
for _, key in ipairs(escapes) do
  map("i", key, "<Esc>", opts)
  map("v", key, "<Esc>", opts)
end
map("v", "JK", "<Esc>", opts)
