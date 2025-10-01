-- Basic Keymaps
-- See `:help vim.keymap.set()`

-- Return to normal mode with jj
vim.keymap.set('i', 'jj', '<ESC>')

-- Navigate up/down half pages with J and K
vim.keymap.set('n', 'J', '<C-d>zz')
vim.keymap.set('n', 'K', '<C-u>zz')
vim.keymap.set('v', 'J', '<C-d>zz')
vim.keymap.set('v', 'K', '<C-u>zz')

-- Clear highlights on search when pressing <Esc> in normal mode
-- See `:help hlsearch`
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Split navigation with CTRL+hjkl
-- NOTE: I've disabled these keymaps because they are set in vim-tmux-navigator
-- vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
-- vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
-- vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
-- vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- floaterminal
vim.keymap.set('n', '<leader>tt', '<cmd>Floaterminal<CR>', { desc = 'Toggle floating terminal' })
-- Uncomment the below line to allow <ESC><ESC> to exit terminal mode. Currently commented out to improve lazygit workflow
-- vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- nvim-treesitter repeatable move keymaps
local ts_repeat_move = require 'nvim-treesitter.textobjects.repeatable_move'

-- Make ; always go to next and , always go to previous
vim.keymap.set({ 'n', 'x', 'o' }, ';', ts_repeat_move.repeat_last_move_next, { desc = 'Repeat last Treesitter move forward' })
vim.keymap.set({ 'n', 'x', 'o' }, ',', ts_repeat_move.repeat_last_move_previous, { desc = 'Repeat last Treesitter move backward' })

-- Also make f/F/t/T repeatable with ; and ,
-- vim.keymap.set({ 'n', 'x', 'o' }, 'f', ts_repeat_move.builtin_f_expr, { expr = true })
-- vim.keymap.set({ 'n', 'x', 'o' }, 'F', ts_repeat_move.builtin_F_expr, { expr = true })
-- vim.keymap.set({ 'n', 'x', 'o' }, 't', ts_repeat_move.builtin_t_expr, { expr = true })
-- vim.keymap.set({ 'n', 'x', 'o' }, 'T', ts_repeat_move.builtin_T_expr, { expr = true })

vim.keymap.set('n', '<leader>q', '<cmd>bd<CR>', { desc = 'Close current buffer' })

vim.keymap.set('n', '<leader>Y', function()
  local v = vim.fn.winsaveview()
  vim.cmd 'keepjumps normal! ggVG"+y'
  vim.fn.winrestview(v)
end, { desc = 'Yank whole buffer into clipboard' })

vim.keymap.set('n', '<leader>V', 'GVgg', { desc = 'Select whole buffer' })

--TODO: Look into using 'jj' to exit terminal mode

vim.keymap.set('n', '<leader>wr', Resize_loop, { desc = 'Enter fluid window resize mode' })
vim.keymap.set('n', '<leader>wn', '<cmd>vnew<CR>', { desc = 'Open new vertical split' })
vim.keymap.set('n', '<leader>wN', '<cmd>new<CR>', { desc = 'Open new horizontal split' })

vim.keymap.set('n', '<leader>cd', function()
  vim.cmd 'Copilot disable'
  vim.notify 'Copilot disabled'
end, { desc = '[D]isable GitHub Copilot' })
vim.keymap.set('n', '<leader>ce', function()
  vim.cmd 'Copilot enable'
  vim.notify 'Copilot enabled'
end, { desc = '[E]nable GitHub Copilot' })

vim.keymap.set('n', '<leader>ta', '<cmd>AerialToggle<CR>', { desc = 'Toggle Aerial' })
