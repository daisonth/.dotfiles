return {
  "nvim-treesitter/nvim-treesitter",
  lazy = false,
  config = function()
    require 'nvim-treesitter.configs'.setup {
      ensure_installed = {
        "javascript",
        "typescript",
        "cpp",
        "bash",
        "solidity",
        "c",
        "lua",
        "rust",
        "toml",
        "php",
        "blade"
      },

      sync_install = false,

      auto_install = true,

      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
      },
      ident = { enable = true },
      rainbow = {
        enable = true,
        extended_mode = true,
        max_file_lines = nil,
      }
    }

    local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
    parser_config.blade = {
      install_info = {
        url = "https://github.com/EmranMR/tree-sitter-blade",
        files = { "src/parser.c" },
        branch = "main",
      },
      filetype = "blade"
    }
    vim.filetype.add({
      pattern = {
        ['.*%.blade%.php'] = 'blade',
      },
    })
  end,
}
