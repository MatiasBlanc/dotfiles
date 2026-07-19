local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)


require("lazy").setup({
  { "folke/tokyonight.nvim", config = function() vim.cmd.colorscheme("tokyonight-night") end },
  { "goolord/alpha-nvim", dependencies = { "nvim-tree/nvim-web-devicons" }, config = function() require("plugins.alpha") end },
  { "nvim-lualine/lualine.nvim" },
  { "akinsho/bufferline.nvim", dependencies = "nvim-tree/nvim-web-devicons" },
  { "nvim-tree/nvim-tree.lua", config = function() require("plugins.nvimtree_config") end },

  { "neovim/nvim-lspconfig" },
  { "williamboman/mason.nvim" },
  { "williamboman/mason-lspconfig.nvim" },
  { "hrsh7th/nvim-cmp" },
  { "hrsh7th/cmp-nvim-lsp" },
  { "hrsh7th/cmp-buffer" },
  { "hrsh7th/cmp-path" },
  { "L3MON4D3/LuaSnip" },
  { "saadparwaiz1/cmp_luasnip" },

  { "nvim-telescope/telescope.nvim", dependencies = { "nvim-lua/plenary.nvim" } },
  { "stevearc/conform.nvim" },
  { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
  { "lewis6991/gitsigns.nvim", config = function() require("gitsigns").setup() end },
  { "mattn/emmet-vim" },
  { "windwp/nvim-autopairs", config = function() require("nvim-autopairs").setup() end },
  { "numToStr/comment.nvim", config = function() require("Comment").setup() end },
  { "lukas-reineke/indent-blankline.nvim", config = function() require("plugins.indent_config") end },
  { "akinsho/toggleterm.nvim", config = function() require("plugins.toggleterm_config") end },
  { "rafamadriz/friendly-snippets" },
  
  {
    "aldoborrero/pi-agent.nvim",
    opts = {
      window = { position = "float", float = { width = "90%", height = "90%", border = "double" } },
    },
    keys = { { "<leader>p", "<cmd>PiAgent<CR>", desc = "Abrir Pi Agent" } }
  },
})
