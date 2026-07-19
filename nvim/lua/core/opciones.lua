-- ============================================
-- Opciones nativas de Neovim
-- ============================================

local opt = vim.opt

-- Interfaz
opt.mouse = "a"                 -- Activar mouse
opt.number = true               -- Mostrar números de línea
opt.numberwidth = 2             -- Ancho de los números
opt.relativenumber = true       -- Números relativos
opt.showmatch = true            -- Mostrar corchetes coincidentes
opt.laststatus = 2              -- Mostrar barra de estado
opt.showmode = false            -- Ocultar el modo (-- INSERT --)
opt.title = true                -- Mostrar título
opt.termguicolors = true        -- Colores verdaderos en la terminal
opt.cursorline = true           -- Resaltar línea actual
opt.signcolumn = "yes"          -- Mostrar columna de signos
opt.scrolloff = 8               -- Margen al hacer scroll
opt.sidescrolloff = 8           -- Margen horizontal

-- Indentación (default 2 espacios, ftplugin override por lenguaje)
opt.tabstop = 2
opt.shiftwidth = 2
opt.softtabstop = 2
opt.expandtab = true            -- Convertir tabs en espacios
opt.smartindent = true          -- Indentación inteligente

-- Búsqueda
opt.ignorecase = true           -- Ignorar mayúsculas en búsqueda
opt.smartcase = true            -- ...excepto si hay mayúsculas
opt.hlsearch = true             -- Resaltar resultados
opt.incsearch = true            -- Búsqueda incremental

-- Rendimiento
opt.updatetime = 250            -- Reducir tiempo de actualización
opt.timeoutlen = 300            -- Tiempo para combos de teclas
opt.lazyredraw = true           -- No redibujar durante macros

-- Encoding
opt.encoding = "utf-8"
opt.fileencoding = "utf-8"

-- División de ventanas
opt.splitbelow = true           -- Split horizontal abajo
opt.splitright = true           -- Split vertical a la derecha

-- Clipboard
opt.clipboard = "unnamedplus"   -- Usar clipboard del sistema

-- Swap y backups
opt.swapfile = false            -- No crear archivos swap
opt.backup = false              -- No crear backups
opt.undofile = true             -- Persistir historial de deshacer

-- Folding (usando Treesitter)
opt.foldmethod = "expr"
opt.foldexpr = "nvim_treesitter#foldexpr()"
opt.foldlevel = 99              -- Abrir todos los folds por defecto

-- Guardar y restaurar folds automáticamente
opt.viewdir = vim.fn.expand("~/.config/nvim/folding")

if vim.fn.isdirectory(opt.viewdir:get()) == 0 then
  vim.fn.mkdir(opt.viewdir:get(), "p")
end
