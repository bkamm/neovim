return {
  'ThePrimeagen/harpoon',
  branch = 'harpoon2',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
    local harpoon = require 'harpoon'

    -- REQUIRED
    harpoon:setup()
    -- REQUIRED
    vim.keymap.set('n', '<leader>a', function()
      harpoon:list():add()
      vim.cmd 'redrawtabline'
    end, { desc = 'Harpoon: [A]dd file' })

    vim.keymap.set('n', '<leader>r', function()
      local list = harpoon:list()
      if not list or not list.items then
        return
      end

      -- Normalize to realpath for stable comparisons
      local function real(p)
        if not p or p == '' then
          return p
        end
        return vim.loop.fs_realpath(p) or p
      end

      local cur = real(vim.api.nvim_buf_get_name(0))

      -- Rebuild items without the current buffer, preserving order
      local keys = {}
      for k, _ in pairs(list.items) do
        if type(k) == 'number' then
          table.insert(keys, k)
        end
      end
      table.sort(keys)

      local compacted = {}
      for _, i in ipairs(keys) do
        local item = list.items[i]
        if item and item.value and item.value ~= '' and real(item.value) ~= cur then
          table.insert(compacted, item)
        end
      end

      list.items = compacted
      vim.cmd 'redrawtabline'
    end, { desc = 'Harpoon: [R]emove file' })

    -- vim.keymap.set('n', '<leader>a', function()
    --   harpoon:list():add()
    -- end, { desc = 'Harpoon: [A]dd file' })
    --
    vim.keymap.set('n', '<leader>h', function()
      harpoon.ui:toggle_quick_menu(harpoon:list())
    end, { desc = 'Harpoon: Toggle menu' })

    vim.keymap.set('n', '<leader>1', function()
      harpoon:list():select(1)
    end, { desc = 'Harpoon: Go to file 1' })
    vim.keymap.set('n', '<leader>2', function()
      harpoon:list():select(2)
    end, { desc = 'Harpoon: Go to file 2' })
    vim.keymap.set('n', '<leader>3', function()
      harpoon:list():select(3)
    end, { desc = 'Harpoon: Go to file 3' })
    vim.keymap.set('n', '<leader>4', function()
      harpoon:list():select(4)
    end, { desc = 'Harpoon: Go to file 4' })
    vim.keymap.set('n', '<leader>5', function()
      harpoon:list():select(5)
    end, { desc = 'Harpoon: Go to file 5' })
    vim.keymap.set('n', '<leader>6', function()
      harpoon:list():select(6)
    end, { desc = 'Harpoon: Go to file 6' })
    vim.keymap.set('n', '<leader>7', function()
      harpoon:list():select(7)
    end, { desc = 'Harpoon: Go to file 7' })
    vim.keymap.set('n', '<leader>8', function()
      harpoon:list():select(8)
    end, { desc = 'Harpoon: Go to file 8' })
    vim.keymap.set('n', '<leader>9', function()
      harpoon:list():select(9)
    end, { desc = 'Harpoon: Go to file 9' })

    -- Toggle previous & next buffers stored within Harpoon list
    vim.keymap.set('n', '<leader>p', function()
      harpoon:list():prev()
    end, { desc = 'Harpoon: [P]revious file' })
    vim.keymap.set('n', '<leader>n', function()
      harpoon:list():next()
    end, { desc = 'Harpoon: [N]ext file' })

    local harpoon_extensions = require 'harpoon.extensions'
    harpoon:extend(harpoon_extensions.builtins.highlight_current_file())
  end,
}
