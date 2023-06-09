-- vim.g.gruvbox_baby_transparent_mode = 1
-- vim.g.gruvbox_baby_background_color = "dark"
vim.g.gruvbox_material_transparent_background = "1"
vim.g.gruvbox_material_background = 'soft'

function ColorMyPencils(color)
  -- color = color or "gruvbox-baby"
  color = color or "gruvbox-material"
  vim.cmd.colorscheme(color)

  vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
  vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

ColorMyPencils()
