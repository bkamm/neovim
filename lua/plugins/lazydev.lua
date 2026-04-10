local not_vscode = require('config.env').not_vscode

return {
  'folke/lazydev.nvim',
  cond = not_vscode,
  ft = 'lua',
  opts = {
    library = {
      { path = '${3rd}/luv/library', words = { 'vim%.uv' } },
    },
  },
}


