-- This config is only loaded for VSCode/Cursor Neovim

if not vim.g.vscode then
    return
end

local function cmd(command)
    return function()
        vim.fn.VSCodeCall(command)
    end
end

vim.keymap.set('n', '<leader>sf', cmd('workbench.action.quickOpen'), { desc = '[S]earch [F]iles' })
vim.keymap.set('n', '<leader>sg', cmd('workbench.action.findInFiles'), { desc = '[S]earch [G]rep' })