local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = " "

local plugins = {
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.0',
    dependencies = { 'nvim-lua/plenary.nvim' }
  },
  'sainnhe/gruvbox-material',
  'nvim-treesitter/nvim-treesitter',
  'ThePrimeagen/harpoon',
  'mbbill/undotree',
  'tpope/vim-fugitive',
  {
    'VonHeikemen/lsp-zero.nvim',
    dependencies = {
      -- LSP Support
      { 'neovim/nvim-lspconfig' },
      { 'williamboman/mason.nvim' },
      { 'williamboman/mason-lspconfig.nvim' },

      -- Autocompletion
      { 'hrsh7th/nvim-cmp' },
      { 'hrsh7th/cmp-buffer' },
      { 'hrsh7th/cmp-path' },
      { 'saadparwaiz1/cmp_luasnip' },
      { 'hrsh7th/cmp-nvim-lsp' },
      { 'hrsh7th/cmp-nvim-lua' },

      -- Snippets
      { 'L3MON4D3/LuaSnip' },
      { 'rafamadriz/friendly-snippets' },
    }
  },
  'Jezda1337/cmp_bootstrap',
  'kyazdani42/nvim-tree.lua',
  'lukas-reineke/indent-blankline.nvim',
  -- 'kyazdani42/nvim-web-devicons',
  {
    'windwp/nvim-autopairs',
    config = function() require('nvim-autopairs').setup({}) end,
  },
  {
    'numToStr/Comment.nvim',
    lazy = false,
    config = function() require('Comment').setup() end
  },
  {
    'goolord/alpha-nvim',
    config = function() require 'alpha'.setup(require 'alpha.themes.dashboard'.config) end
  },
  'akinsho/bufferline.nvim',
  'vimwiki/vimwiki',
  'numToStr/FTerm.nvim',
  'norcalli/nvim-colorizer.lua',
  {
    'nvimdev/lspsaga.nvim',
    lazy = true,
    branch = 'main',
    event = 'LspAttach',
    config = function() require('lspsaga').setup({}) end,
    dependencies = {
      { 'nvim-tree/nvim-web-devicons' },
      { 'nvim-treesitter/nvim-treesitter' }
    }
  },
  {
    'laytan/tailwind-sorter.nvim',
    dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-lua/plenary.nvim' },
    build = 'cd formatter && npm i && npm run build',
    config = true,
  },
  {
    'razak17/tailwind-fold.nvim',
    opts = {},
    dependencies = { 'nvim-treesitter/nvim-treesitter' },
    ft = { 'html', 'php', 'svelte', 'astro', 'vue', 'typescriptreact' },
  }
}

require("lazy").setup(plugins)
