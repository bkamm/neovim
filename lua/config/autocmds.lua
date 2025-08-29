-- Basic Autocommands

-- Highlight when yanking (copying) text
-- Try it with `yap` in normal mode
-- See `:help vim.hl.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.hl.on_yank()
  end,
})

-- Disable listchars in terminal windows only
vim.api.nvim_create_autocmd({ 'TermOpen', 'BufWinEnter' }, {
  desc = 'Turn off list in terminal buffers',
  group = vim.api.nvim_create_augroup('terminal-no-list', { clear = true }),
  callback = function(args)
    if vim.bo[args.buf].buftype == 'terminal' then
      vim.opt_local.list = false
    end
  end,
})


