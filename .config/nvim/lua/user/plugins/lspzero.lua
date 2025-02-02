return {
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
  },

  config = function()
    local lsp_zero = require('lsp-zero')
    require('mason').setup({})

    lsp_zero.on_attach(function(client, bufnr)
      local opts = { buffer = bufnr, remap = false }

      vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
      vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
      vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
      vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
      vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
      vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
      vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
      vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
      vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
      vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
    end)


    require('mason-lspconfig').setup({
      ensure_installed = {
        'ts_ls',
        'eslint',
        'lua_ls',
        'rust_analyzer',
        'emmet_ls',
        'htmx',
        'html',
      },
      handlers = {
        lsp_zero.default_setup,

        lua_ls = function()
          local lua_opts = lsp_zero.nvim_lua_ls()
          require('lspconfig').lua_ls.setup(lua_opts)
        end,

        htmx = function()
          require('lspconfig').htmx.setup({
            filetypes = {
              "blade",
              "html",
            }
          })
        end,

        html = function()
          require('lspconfig').html.setup({
            filetypes = {
              "blade",
              "html",
            }
          })
        end,

        emmet_ls = function()
          require('lspconfig').emmet_ls.setup({
            filetypes = {
              "css",
              "html",
              "javascript",
              "javascriptreact",
              "less",
              "sass",
              "scss",
              "svelte",
              "php",
              "htmx",
              "typescriptreact",
              "vue",
              "blade"
            },
          })
        end,
      }
    })

    local cmp = require('cmp')

    local cmp_select = { behavior = cmp.SelectBehavior.Select }

    cmp.setup({
      sources = {
        { name = 'path' },
        { name = "copilot" },
        { name = 'nvim_lsp' },
        { name = 'nvim_lua' },
        { name = 'luasnip', keyword_length = 1 },
        { name = 'buffer',  keyword_length = 3 },
      },
      formatting = lsp_zero.cmp_format(),
      mapping = cmp.mapping.preset.insert({
        ['<M-p>'] = cmp.mapping.select_prev_item(cmp_select),
        ['<M-n>'] = cmp.mapping.select_next_item(cmp_select),
        ['<M-y>'] = cmp.mapping.confirm({ select = true }),
        ["<M-Space>"] = cmp.mapping.complete(),
      }),
    })
  end
}
