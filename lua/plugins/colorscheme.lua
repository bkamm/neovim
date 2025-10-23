return {
  {
    'catppuccin/nvim',
    name = 'catppuccin',
    priority = 1000,
    config = function()
      ---@diagnostic disable-next-line: missing-fields
      require('catppuccin').setup { no_italic = true }
      vim.cmd.colorscheme 'catppuccin-macchiato'
    end,
  },
  {
    'nordtheme/vim',
    name = 'nord',
    priority = 1000,
  },
  {
    'rose-pine/neovim',
    name = 'rose-pine',
    priority = 1000,
    config = function()
      require('rose-pine').setup {
        styles = {
          bold = false,
          italic = false,
          transparency = false,
        },
      }
      -- vim.cmd.colorscheme 'rose-pine'
    end,
  },
  {
    'sainnhe/gruvbox-material',
    lazy = false,
    priority = 1000,
    config = function()
      -- Optionally configure and load the colorscheme
      -- directly inside the plugin declaration.
      vim.g.gruvbox_material_enable_italic = false
    end,
  },
}
