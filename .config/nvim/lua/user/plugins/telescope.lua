return {
  'nvim-telescope/telescope.nvim',
  tag = '0.1.4',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
    local builtin = require('telescope.builtin')
    local actions = require("telescope.actions")

    vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
    vim.keymap.set('n', '<leader>of', builtin.oldfiles, {})
    vim.keymap.set('n', '<leader>gf', builtin.git_files, {})
    vim.keymap.set('n', '<leader>ss', function() builtin.grep_string({ search = vim.fn.input("Grep > ") }) end)

    require("telescope").setup({
      defaults = {
        mappings = {
          n = {
            ["q"] = actions.close,
            ["<leader>i"] = actions.close,
          },
        },
      },
    })
  end
}
