-- This config is only loaded for VSCode/Cursor Neovim

if not vim.g.vscode then
    return
end

local vscode = require 'vscode'

local function cmd(command)
    return function()
        vscode.action(command)
    end
end

vim.keymap.set('n', '<leader>sf', cmd('workbench.action.quickOpen'), { desc = '[S]earch [F]iles' })
vim.keymap.set('n', '<leader>sg', cmd('workbench.action.findInFiles'), { desc = '[S]earch [G]rep' })

vim.keymap.set('n', '<leader>wn', cmd('workbench.action.splitEditorRight'), { desc = 'Open new vertical split' })
vim.keymap.set('n', '<leader>wN', cmd('workbench.action.splitEditorDown'), { desc = 'Open new horizontal split' })

vim.keymap.set('n', '<leader>K', cmd('editor.action.showHover'), { desc = 'Show hover documentation' })
vim.keymap.set('n', '<leader>grd', cmd('editor.action.revealDefinition'), { desc = 'Goto [D]efinition' })
vim.keymap.set('n', '<leader>grD', cmd('editor.action.peekDefinition'), { desc = 'Peek [D]efinition' })
vim.keymap.set('n', '<leader>grr', cmd('editor.action.referenceSearch.trigger'), { desc = 'Show [R]eferences' })
vim.keymap.set('n', '<leader>gra', cmd('editor.action.quickFix'), { desc = 'Show Code [A]ction' })
vim.keymap.set('n', '<leader>grn', cmd('editor.action.rename'), { desc = '[R]ename' })