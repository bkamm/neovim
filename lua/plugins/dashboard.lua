local not_vscode = require('config.env').not_vscode

return {
  'folke/snacks.nvim',
  cond = not_vscode,
  ---@type snacks.Config
  opts = {
    dashboard = {
      -- your dashboard configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    },
  },
}
