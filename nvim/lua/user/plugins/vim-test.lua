return {
  'vim-test/vim-test',
  keys = {
    { '<leader>tn', ':TestNearest<cr>' },
    { '<leader>tf', ':TestFile<cr>' },
    { '<leader>ts', ':TestSuite<cr>' },
    { '<leader>tl', ':TestLast<cr>' },
    { '<leader>tv', ':TestVisit<cr>' },
  },
  config = function()
    vim.cmd([[
      let g:test#strategy = 'neovim'
      let g:test#neovim#start_normal = 1
      let g:test#php#phpunit#executable = './vendor/bin/phpunit'
    ]])
  end,
}
