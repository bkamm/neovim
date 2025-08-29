-- Core options

-- Make line numbers default
vim.o.number = true
-- Relative line numbers for easier navigation
vim.o.relativenumber = true

-- Enable mouse support
vim.o.mouse = 'a'

-- Don't show the mode (statusline handles it)
vim.o.showmode = false

-- Sync clipboard with the OS (scheduled for faster startup)
vim.schedule(function()
  vim.o.clipboard = 'unnamedplus'
end)

-- Indentation and whitespace
vim.o.breakindent = true
vim.o.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.softtabstop = 4

-- Undo history (disabled as per current config)
vim.o.undofile = false

-- Searching
vim.o.ignorecase = true
vim.o.smartcase = true

-- UI/behavior
vim.o.signcolumn = 'yes'
vim.o.updatetime = 250
vim.o.timeoutlen = 300
vim.o.splitright = true
vim.o.splitbelow = true
vim.o.inccommand = 'split'
vim.o.cursorline = true
vim.o.scrolloff = 10
vim.o.confirm = true


