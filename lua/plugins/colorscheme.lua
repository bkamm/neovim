return {
  'catppuccin/nvim',
  name = 'catppuccin',
  priority = 1000,
  config = function()
    ---@diagnostic disable-next-line: missing-fields
    require('catppuccin').setup { no_italic = true }
    vim.cmd.colorscheme 'catppuccin-macchiato'
  end,
}


