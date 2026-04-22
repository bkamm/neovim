-- In Cursor/VSCode, flash.nvim uses its own Flash* colors (see lazy/flash.nvim/lua/flash/highlight.lua).
-- Terminal Neovim links Flash* to Search/Substitute from your colorscheme instead.
-- Below: only when embedded — turn off match/backdrop painting, and paint jump labels as green text only.
--
-- local function vscode_flash_like_terminal()
--   local green = { fg = '#a6da95', bg = 'NONE', bold = true, nocombine = true, default = false }
--   local grey = { fg = '#7c7f93', bg = 'NONE', bold = true, nocombine = true, default = false }
--   local light_grey = { fg = '#ABB5F9', bg = 'NONE', bold = true, nocombine = true, default = false }
--   local orange = { fg = '#ff966c', bg = 'NONE', bold = true, nocombine = true, default = false }
--   vim.api.nvim_set_hl(0, 'FlashLabel', green)
--   vim.api.nvim_set_hl(0, 'FlashCurrent', orange)
--   vim.api.nvim_set_hl(0, 'FlashBackdrop', grey)
--   vim.api.nvim_set_hl(0, 'FlashMatch', light_grey)
-- end

return {
  'folke/flash.nvim',
  event = 'VeryLazy',
  -- -- Swap following code to disable the flash.nvim colors in VSCode/Cursor Neovim (and uncomment the code at the top of this file to use custom colors)
  ---@type flash.Config
  opts = {},
  -- opts = function()
  --   if not vim.g.vscode then
  --     return {}
  --   end
  --   return {
  --     highlight = {
  --       backdrop = false,
  --       matches = false,
  --     },
  --     modes = {
  --       char = {
  --         highlight = { backdrop = false, matches = false },
  --       },
  --     },
  --   }
  -- end,
  -- config = function()
  --   if vim.g.vscode then
  --     vscode_flash_like_terminal()
  --     vim.api.nvim_create_autocmd('ColorScheme', { callback = vscode_flash_like_terminal })
  --   end
  -- end,
  

  -- stylua: ignore
  keys = {
    { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
    { "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
    { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
    { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Flash Treesitter Search" },
    { "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
  },
}
