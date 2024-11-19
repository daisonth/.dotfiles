return {
  'nvimdev/lspsaga.nvim',
  lazy = false,
  branch = 'main',
  event = 'LspAttach',
  config = function() require('lspsaga').setup({}) end,
  dependencies = {
    { 'nvim-tree/nvim-web-devicons' },
    { 'nvim-treesitter/nvim-treesitter' }
  }
}
