return {
  {
    'catppuccin/nvim',
    name = 'catppuccin',
    priority = 1000,
    config = function()
      ---@diagnostic disable-next-line: missing-fields
      require('catppuccin').setup { no_italic = true }
      -- vim.cmd.colorscheme 'catppuccin-macchiato'
    end,
  },
  {
    'nordtheme/vim',
    name = 'nord',
    priority = 1000,
  },
  {
    'ellisonleao/gruvbox.nvim',
    priority = 1000,
    config = true,
    opts = {
      bold = false,
      -- italic = { strings = false, comments = false, operators = false, folds = false },
    },
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
          transparency = true,
        },
      }
      vim.cmd.colorscheme 'rose-pine'
    end,
  },
}
