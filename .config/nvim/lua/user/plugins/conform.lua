return {
  'stevearc/conform.nvim',
  confir = function()
    require("conform").setup({
      formatters_by_ft = {
        lua = { "stylua" },
        css = { "cssls" },
        json = { "fixjson" },
        blade = { "blade-formatter" },
        -- Conform will run multiple formatters sequentially
        python = { "isort", "black" },
        -- Use a sub-list to run only the first available formatter
        javascript = { { "prettierd", "prettier" } },
      },
    })

    vim.api.nvim_create_autocmd("BufWritePre", {
      pattern = "*",
      callback = function(args)
        require("conform").format({ bufnr = args.buf })
      end,
    })
  end
}
