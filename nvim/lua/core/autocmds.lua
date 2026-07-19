-- ============================================
-- Autocomandos de Neovim
-- ============================================

local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

-- ============================================
-- Resaltar al copiar (yank)
-- ============================================

local yank_group = augroup("HighlightYank", { clear = true })

autocmd("TextYankPost", {
  group = yank_group,
  pattern = "*",
  callback = function()
    vim.highlight.on_yank({
      higroup = "IncSearch",
      timeout = 150,
    })
  end,
})

-- ============================================
-- Guardar y restaurar folds
-- ============================================

local fold_group = augroup("RememberFolds", { clear = true })

autocmd("BufWritePost", {
  group = fold_group,
  pattern = "*",
  command = "mkview",
})

autocmd("BufRead", {
  group = fold_group,
  pattern = "*",
  command = "silent! loadview",
})

-- ============================================
-- Remover espacios en blanco al guardar
-- ============================================

local trim_group = augroup("TrimWhitespace", { clear = true })

autocmd("BufWritePre", {
  group = trim_group,
  pattern = "*",
  callback = function()
    local save = vim.fn.winsaveview()
    vim.cmd([[%s/\s\+$//e]])
    vim.fn.winrestview(save)
  end,
})

-- ============================================
-- Auto-resize ventanas al cambiar tamaño terminal
-- ============================================

local resize_group = augroup("AutoResize", { clear = true })

autocmd("VimResized", {
  group = resize_group,
  pattern = "*",
  command = "tabdo wincmd =",
})

-- ============================================
-- Abrir archivo en la última posición editada
-- ============================================

local last_pos_group = augroup("LastPosition", { clear = true })

autocmd("BufReadPost", {
  group = last_pos_group,
  pattern = "*",
  callback = function()
    local mark = vim.api.nvim_buf_get_mark(0, '"')
    local line_count = vim.api.nvim_buf_line_count(0)
    if mark[1] > 0 and mark[1] <= line_count then
      vim.api.nvim_win_set_cursor(0, mark)
    end
  end,
})

-- ============================================
-- filetype para archivos específicos
-- ============================================

local ft_group = augroup("FileTypes", { clear = true })

autocmd({ "BufNewFile", "BufRead" }, {
  group = ft_group,
  pattern = "*.jsx",
  command = "set filetype=javascriptreact",
})

autocmd({ "BufNewFile", "BufRead" }, {
  group = ft_group,
  pattern = "*.tsx",
  command = "set filetype=typescriptreact",
})

-- ============================================
-- Quitar números de línea en terminal
-- ============================================

local term_group = augroup("TerminalSettings", { clear = true })

autocmd("TermOpen", {
  group = term_group,
  pattern = "*",
  callback = function()
    vim.opt_local.number = false
    vim.opt_local.relativenumber = false
    vim.cmd("startinsert")
  end,
})
