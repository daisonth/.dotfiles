return {
  'goolord/alpha-nvim',
  config = function()
    local alpha = require("alpha")
    local dashboard = require("alpha.themes.dashboard")
    dashboard.section.header.val = {
      [[                               __                ]],
      [[  ___     ___    ___   __  __ /\_\    ___ ___    ]],
      [[ / _ `\  / __`\ / __`\/\ \/\ \\/\ \  / __` __`\  ]],
      [[/\ \/\ \/\  __//\ \_\ \ \ \_/ |\ \ \/\ \/\ \/\ \ ]],
      [[\ \_\ \_\ \____\ \____/\ \___/  \ \_\ \_\ \_\ \_\]],
      [[ \/_/\/_/\/____/\/___/  \/__/    \/_/\/_/\/_/\/_/]],
    }
    dashboard.section.buttons.val = {
      dashboard.button("N", "📰 New file", "<cmd>ene <CR>"),
      dashboard.button("F", "🔎 Find file", "<cmd>Telescope find_files<CR>"),
      dashboard.button("R", "🗃 Recently opened files", "<cmd>Telescope oldfiles<CR>"),
      dashboard.button("V", "📓 Neorg", "<cmd>Neorg index<CR>"),
      dashboard.button("P", "📦 Lazy", "<cmd>Lazy install<CR>"),
      dashboard.button("q", "🔴 Quit NVIM", ":qa<CR>"),
    }
    dashboard.config.opts.noautocmd = true

    -- vim.cmd([[autocmd User AlphaReady echo 'ready']])

    alpha.setup(dashboard.config)
    -- require 'alpha'.setup(require 'alpha.themes.dashboard'.config)
  end
}
