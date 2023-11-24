local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
  local opts = { buffer = bufnr, remap = false }

  vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
  vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
  vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
  vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
  vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
  vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
  vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
  vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
  vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
  vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
end)

require('mason').setup({})
require('mason-lspconfig').setup({
  ensure_installed = {
    'tsserver',
    'eslint',
    'lua_ls',
    'rust_analyzer',
    'emmet_ls',
  },
  handlers = {
    lsp_zero.default_setup,

    lua_ls = function()
      local lua_opts = lsp_zero.nvim_lua_ls()
      require('lspconfig').lua_ls.setup(lua_opts)
    end,

    emmet_ls = function()
      require('lspconfig').emmet_ls.setup({
        filetypes = {
          "css",
          "eruby",
          "html",
          "javascript",
          "javascriptreact",
          "less",
          "sass",
          "scss",
          "svelte",
          "php",
          "pug",
          "typescriptreact", "vue" },
      })
    end,
  }
})

local cmp = require('cmp')
local cmp_select = { behavior = cmp.SelectBehavior.Select }

cmp.setup({
  sources = {
    { name = 'path' },
    { name = 'nvim_lsp' },
    { name = 'nvim_lua' },
    { name = 'buffer',  keyword_length = 3 },
    { name = 'luasnip', keyword_length = 2 },
  },
  formatting = lsp_zero.cmp_format(),
  mapping = cmp.mapping.preset.insert({
    ['<M-p>'] = cmp.mapping.select_prev_item(cmp_select),
    ['<M-n>'] = cmp.mapping.select_next_item(cmp_select),
    ['<M-y>'] = cmp.mapping.confirm({ select = true }),
    ["<M-Space>"] = cmp.mapping.complete(),
  }),
})

-- local lsp = require('lsp-zero')
--
-- lsp.on_attach(function(client, bufnr)
--   local opts = { buffer = bufnr, remap = false }
--
--   vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
--   vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
--   vim.keymap.set("n", "<leader>vws", vim.lsp.buf.workspace_symbol, opts)
--   vim.keymap.set("n", "<leader>vd", vim.diagnostic.open_float, opts)
--   vim.keymap.set("n", "[d", vim.diagnostic.goto_next, opts)
--   vim.keymap.set("n", "]d", vim.diagnostic.goto_prev, opts)
--   vim.keymap.set("n", "<leader>vca", vim.lsp.buf.code_action, opts)
--   vim.keymap.set("n", "<leader>vrr", vim.lsp.buf.references, opts)
--   vim.keymap.set("n", "<leader>vrn", vim.lsp.buf.rename, opts)
--   vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help, opts)
-- end)
--
-- lsp.preset('recommended')
--
-- require('mason').setup({})
-- require('mason-lspconfig').setup({
--   ensure_installed = {
--       'tsserver',
--       'eslint',
--       'lua_ls',
--       'rust_analyzer',
--       'emmet_ls',
--   },
--   handlers = {
--     lsp_zero.default_setup,
--     lua_ls = function()
--       local lua_opts = lsp_zero.nvim_lua_ls()
--       require('lspconfig').lua_ls.setup(lua_opts)
--     end,
--   }
-- })
--
-- local cmp = require('cmp')
-- local cmp_select = {behavior = cmp.SelectBehavior.Select}
--
-- -- Fix Undefined global 'vim'
-- lsp.configure('lua_ls', {
--   settings = {
--     Lua = {
--       diagnostics = {
--         globals = { 'vim' }
--       }
--     }
--   }
-- })
--
-- lsp.configure('emmet_ls', {
--   filetypes = { 'html', 'php', 'typescript' }
-- })
--
-- require("bootstrap-cmp.config"):setup({
--   file_types = { 'html', 'php' },
-- })
--
-- local cmp = require('cmp')
-- local cmp_select = { behavior = cmp.SelectBehavior.Select }
-- require('luasnip.loaders.from_vscode').lazy_load()
--
-- cmp.setup({
--   sources = {
--     { name = 'path' },
--     { name = 'nvim_lsp' },
--     { name = 'nvim_lua' },
--     { name = 'bootstrap' },
--     { name = 'buffer',  keyword_length = 3 },
--     { name = 'luasnip', keyword_length = 2 },
--   },
--   formatting = lsp_zero.cmp_format(),
--   mapping = cmp.mapping.preset.insert({
--   ['<M-p>'] = cmp.mapping.select_prev_item(cmp_select),
--   ['<M-n>'] = cmp.mapping.select_next_item(cmp_select),
--   ['<M-y>'] = cmp.mapping.confirm({ select = true }),
--   ["<M-Space>"] = cmp.mapping.complete(),
--   }),
-- })
--
--
-- -- disable completion with tab
-- -- this helps with copilot setup
-- -- cmp_mappings['<Tab>'] = nil
-- -- cmp_mappings['<S-Tab>'] = nil
--
-- -- lsp.setup_nvim_cmp({
-- --   mapping = cmp_mappings
-- -- })
--
-- lsp.set_preferences({
--   suggest_lsp_servers = false,
--   sign_icons = {
--     error = 'E',
--     warn = 'W',
--     hint = 'H',
--     info = 'I'
--   }
-- })
--
--
-- lsp.setup()
--
-- vim.diagnostic.config({
--   virtual_text = true,
-- })
