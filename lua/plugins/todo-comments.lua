local not_vscode = require('config.env').not_vscode
return {
    'folke/todo-comments.nvim',
    cond = not_vscode,
    event = 'VimEnter',
    dependencies = { 'nvim-lua/plenary.nvim' },
    opts = { signs = false },
    config = function()
        require('todo-comments').setup {
            signs = false,
        }
    end,
}


