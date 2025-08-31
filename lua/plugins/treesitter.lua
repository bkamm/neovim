return {
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate',
  main = 'nvim-treesitter.configs',
  dependencies = {
    'nvim-treesitter/nvim-treesitter-textobjects',
  },
  opts = {
    ensure_installed = {
      'bash',
      'c',
      'cpp',
      'diff',
      'html',
      'lua',
      'luadoc',
      'markdown',
      'markdown_inline',
      'query',
      'vim',
      'vimdoc',
      'javascript',
      'typescript',
      'json',
      'HTML',
      'css',
      'tmux',
    },
    auto_install = true,
    highlight = {
      enable = true,
      additional_vim_regex_highlighting = { 'ruby' },
    },
    indent = { enable = true, disable = { 'ruby' } },

    -- Incremental selection
    incremental_selection = {
      enable = true,
      keymaps = {
        init_selection = '<C-space>',
        node_incremental = '<C-space>',
        scope_incremental = false,
        node_decremental = '<BS>',
      },
    },

    -- Text objects
    textobjects = {
      select = {
        enable = true,
        lookahead = true,
        keymaps = {
          -- Functions
          ['af'] = '@function.outer',
          ['if'] = '@function.inner',
          -- Classes
          ['ac'] = '@class.outer',
          ['ic'] = '@class.inner',
          -- Blocks
          ['ab'] = '@block.outer',
          ['ib'] = '@block.inner',
          -- Loops
          ['al'] = '@loop.outer',
          ['il'] = '@loop.inner',
          -- Parameters
          ['aa'] = '@parameter.outer',
          ['ia'] = '@parameter.inner',
          -- Comments
          ['aC'] = '@comment.outer',
          ['iC'] = '@comment.inner',
        },
      },

      -- Navigation
      move = {
        enable = true,
        set_jumps = true,
        goto_next_start = {
          [']f'] = '@function.outer',
          [']c'] = '@class.outer',
          [']l'] = '@loop.outer',
          [']a'] = '@parameter.inner',
          [']z'] = '@fold',
        },
        goto_next_end = {
          [']F'] = '@function.outer',
          [']C'] = '@class.outer',
          [']L'] = '@loop.outer',
        },
        goto_previous_start = {
          ['[f'] = '@function.outer',
          ['[c'] = '@class.outer',
          ['[l'] = '@loop.outer',
          ['[a'] = '@parameter.inner',
          ['[z'] = '@fold',
        },
        goto_previous_end = {
          ['[F'] = '@function.outer',
          ['[C'] = '@class.outer',
          ['[L'] = '@loop.outer',
        },
      },

      -- Swap operations
      swap = {
        enable = true,
        swap_next = {
          ['<leader>sp'] = '@parameter.inner',
        },
        swap_previous = {
          ['<leader>sP'] = '@parameter.inner',
        },
      },
    },
  },
}
