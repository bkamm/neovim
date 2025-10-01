return {
  'iamcco/markdown-preview.nvim',
  cmd = { 'MarkdownPreviewToggle', 'MarkdownPreview', 'MarkdownPreviewStop' },
  build = function()
    require('lazy').load { plugins = { 'markdown-preview.nvim' } }
    vim.fn['mkdp#util#install']()
  end,
  keys = {
    {
      '<leader>mp',
      ft = 'markdown',
      '<cmd>MarkdownPreviewToggle<cr>',
      desc = '[M]arkdown [P]review',
    },
  },
  config = function()
    vim.cmd [[
      function OpenMarkdownPreview(url)
        execute "silent ! open -a 'Google Chrome' -n --args --new-window " . a:url
      endfunction
      let g:mkdp_browserfunc = 'OpenMarkdownPreview'
      do FileType
    ]]
  end,
}
