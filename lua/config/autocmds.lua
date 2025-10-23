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

-- Persist line number highlights across colorscheme changes
vim.api.nvim_create_autocmd('ColorScheme', {
  desc = 'Keep custom line number colors when changing colorschemes',
  group = vim.api.nvim_create_augroup('persist-line-numbers', { clear = true }),
  pattern = '*',
  callback = function()
    vim.api.nvim_set_hl(0, 'LineNr', { fg = '#7c7f93', bold = false })
    vim.api.nvim_set_hl(0, 'CursorLineNr', { fg = '#ffcc00', bold = true })
  end,
})

-- I have commented this function out for now because it is causing splits to close when I open telescope
-- -- autocmd: delete [No Name] buffers when leaving them, if unmodified
-- vim.api.nvim_create_autocmd('BufLeave', {
--   callback = function(args)
--     local bufnr = args.buf
--     local name = vim.api.nvim_buf_get_name(bufnr)
--     local modified = vim.api.nvim_get_option_value('modified', { buf = bufnr })
--     local buftype = vim.api.nvim_get_option_value('buftype', { buf = bufnr })
--
--     -- matches unnamed, empty, unmodified buffers
--     if name == '' and not modified and buftype == '' then
--       -- Schedule the delete to happen after switching to the next buffer
--       vim.schedule(function()
--         if vim.api.nvim_buf_is_valid(bufnr) then
--           -- Before deleting, ensure the current buffer is properly loaded
--           local current = vim.api.nvim_get_current_buf()
--           if current ~= bufnr and vim.bo[current].filetype == '' and vim.api.nvim_buf_get_name(current) ~= '' then
--             vim.cmd 'edit'
--           end
--           vim.api.nvim_buf_delete(bufnr, { force = true })
--         end
--       end)
--     end
--   end,
-- })
