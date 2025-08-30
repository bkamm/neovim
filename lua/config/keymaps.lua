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

-- Diagnostic keymaps
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Split navigation with CTRL+hjkl
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- floaterminal
vim.keymap.set('n', '<leader>tt', '<cmd>Floaterminal<CR>', { desc = 'Toggle floating terminal' })
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })
