return {
  'echasnovski/mini.nvim',
  config = function()
    require('mini.ai').setup { n_lines = 500 }
    require('mini.surround').setup {
      mappings = {
        add = 'gsa', -- Add surrounding in Normal and Visual modes
        delete = 'gsd', -- Delete surrounding
        find = 'gsf', -- Find surrounding (to the right)
        find_left = 'gsF', -- Find surrounding (to the left)
        highlight = 'gsh', -- Highlight surrounding
        replace = 'gsr', -- Replace surrounding

        suffix_last = 'l', -- Suffix to search with "prev" method
        suffix_next = 'n', -- Suffix to search with "next" method
      },
    }
    require('mini.icons').setup()
    -- require('mini.tabline').setup() -- Uncomment and delete bufferline to enable more simple tabline
    require('mini.jump2d').setup() -- Similar use case to flash.nvim, but no conflicting keymaps so keeping
    -- require('mini.jump').setup() -- Using flash.nvim instead
    -- local jump = require 'mini.jump'
    -- jump.setup {
    --   delay = {
    --     highlight = 0,
    --     idle_stop = 100000000,
    --   },
    -- }

    local map = require 'mini.map'
    map.setup {
      integrations = {
        map.gen_integration.builtin_search(),
        map.gen_integration.diagnostic(),
        map.gen_integration.gitsigns(),
      },
      window = {
        side = 'right',
        width = 20,
        show_integration_count = false,
      },
      -- optional: nicer dots
      symbols = { encode = map.gen_encode_symbols.dot '4x2' },
    }

    -- keymaps (optional)
    vim.keymap.set('n', '<leader>mm', map.toggle, { desc = 'MiniMap Toggle' })
    vim.keymap.set('n', '<leader>mo', map.open, { desc = 'MiniMap Open' })
    vim.keymap.set('n', '<leader>mc', map.close, { desc = 'MiniMap Close' })
    vim.keymap.set('n', '<leader>mr', map.refresh, { desc = 'MiniMap Refresh' })
  end,
}
