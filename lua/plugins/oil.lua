return {
  'stevearc/oil.nvim',
  ---@module 'oil'
  ---@type oil.SetupOpts
  opts = {
    default_file_explorer = true,
    view_options = {
      show_hidden = true,
    },
    keymaps = {
      -- Disabled the following to avoid conflicts with vim-tmux-navigator
      ['<C-j>'] = false,
      ['<C-k>'] = false,
      ['<C-h>'] = false,
      ['<C-l>'] = false,
    },
  },
  -- Optional dependencies
  dependencies = { { 'echasnovski/mini.icons', opts = {} } },
  -- dependencies = { "nvim-tree/nvim-web-devicon" }, -- use if you prefer nvim-web-devicons
  -- Lazy loading is not recommended because it is very tricky to make it work correctly in all situations.
  lazy = false,

  vim.keymap.set('n', '<leader>e', '<CMD>Oil<CR>', { desc = '[E]xplore current directory' }),
}

-- NOTE: use - to go up a directory and _ to go to the projects current working directory
