local M = {}

--- Use as lazy.nvim `cond` for plugins that need a full terminal UI or clash with VSCode/Cursor Neovim.
function M.not_vscode()
  return not vim.g.vscode
end

return M
