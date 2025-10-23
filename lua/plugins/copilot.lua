return {
  'github/copilot.vim',
  config = function()
    -- Disable Copilot’s default <Tab> mapping
    vim.g.copilot_no_tab_map = true

    -- Map <C-J> to accept the current suggestion
    vim.keymap.set('i', '<C-J>', 'copilot#Accept("<CR>")', {
      expr = true,
      replace_keycodes = false,
      desc = 'Accept Copilot suggestion',
    })
  end,
}
