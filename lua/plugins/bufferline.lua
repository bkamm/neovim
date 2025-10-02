return {
  'akinsho/bufferline.nvim',
  version = '*',
  dependencies = 'nvim-tree/nvim-web-devicons',
  opts = function()
    local harpoon = require 'harpoon'

    -- Normalize to realpath for stable comparisons
    local function real(p)
      if not p or p == '' then
        return p
      end
      return vim.loop.fs_realpath(p) or p
    end

    -- Make sure each Harpoon item has a listed buffer so bufferline can show it
    local function sync_harpoon_buffers()
      local list = harpoon:list()
      if not list or not list.items then
        return
      end
      for _, item in ipairs(list.items) do
        local path = real(item.value)
        if path and path ~= '' then
          local bufnr = vim.fn.bufnr(path)
          if bufnr == -1 then
            -- Buffer doesn't exist yet, create it with bufadd
            bufnr = vim.fn.bufadd(path)
          end
          if bufnr > 0 then
            pcall(vim.api.nvim_set_option_value, 'buflisted', true, { buf = bufnr })
          end
        end
      end
    end

    -- Keep the buffer list in sync at useful moments
    vim.api.nvim_create_autocmd({ 'VimEnter', 'DirChanged', 'FocusGained' }, {
      callback = sync_harpoon_buffers,
    })

    -- Lookup helpers
    local function in_harpoon_bufnr(bufnr)
      local name = real(vim.api.nvim_buf_get_name(bufnr))
      if not name or name == '' then
        return false
      end
      local list = harpoon:list()
      if not list or not list.items then
        return false
      end
      for _, item in ipairs(list.items) do
        if real(item.value) == name then
          return true
        end
      end
      return false
    end

    local function harpoon_index(path)
      path = real(path)
      local list = harpoon:list()
      if not list or not list.items then
        return math.huge
      end
      for i, item in ipairs(list.items) do
        if real(item.value) == path then
          return i
        end
      end
      return math.huge
    end

    local function buffer_path(buf)
      local p = vim.api.nvim_buf_get_name(buf.id)
      return real(p) or p
    end

    return {
      options = {
        diagnostics = 'nvim_lsp',
        show_buffer_close_icons = true,
        show_close_icon = true,
        offsets = {
          {
            filetype = 'neo-tree',
            text = 'Neo-tree',
            highlight = 'Directory',
            text_align = 'left',
          },
        },

        -- Show Harpoon index for Harpoon buffers; blank for others
        numbers = function(opts)
          local idx = harpoon_index(vim.api.nvim_buf_get_name(opts.id))
          return (idx ~= math.huge) and tostring(idx) or ''
        end,

        -- Order: all Harpoon buffers first (by Harpoon order), then others by buffer ordinal
        sort_by = function(a, b)
          local ia = harpoon_index(buffer_path(a))
          local ib = harpoon_index(buffer_path(b))
          local a_is_h = ia ~= math.huge
          local b_is_h = ib ~= math.huge
          if a_is_h ~= b_is_h then
            return a_is_h -- Harpoon group first
          end
          if a_is_h and b_is_h then
            return ia < ib -- keep Harpoon’s order
          end
          -- neither is Harpoon: fall back to buffer number (lower first)
          return a.ordinal < b.ordinal
        end,

        -- Group headers act as a visible separator between Harpoon and others
        groups = {
          items = {
            {
              name = 'Harpoon',
              matcher = function(buf)
                return in_harpoon_bufnr(buf.id)
              end,
            },
            {
              name = 'Buffers',
              matcher = function(buf)
                return not in_harpoon_bufnr(buf.id)
              end,
            },
          },
        },

        -- Optional: keep tabline visible even with 0–1 buffers
        -- always_show_bufferline = true,
      },
      -- highlights = { ... } -- your highlights can go here if you re-enable
    }
  end,
}
