return {
  'akinsho/bufferline.nvim',
  version = '*',
  dependencies = 'nvim-tree/nvim-web-devicons',
  opts = {
    options = {
      diagnostics = 'nvim_lsp',
      show_buffer_close_icons = true,
      show_close_icon = true,
      -- modified_icon = '●',
      offsets = {
        {
          filetype = 'neo-tree',
          text = 'Neo-tree',
          highlight = 'Directory',
          text_align = 'left',
        },
      },
    },
    -- highlights = {
    --   buffer_selected = {
    --     italic = false,
    --     bold = true,
    --   },
    --   modified = {
    --     fg = { attribute = 'fg', highlight = 'Normal' },
    --   },
    --   modified_selected = {
    --     fg = { attribute = 'fg', highlight = 'Normal' },
    --   },
    -- },
  },
}
