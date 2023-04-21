return {
  'nvim-tree/nvim-tree.lua',
  version = '*',
  lazy = false,
  dependencies = 'kyazdani42/nvim-web-devicons',
  keys = {
    { '<leader>n', '<cmd>NvimTreeToggle<cr>' },
    { '<leader>N', '<cmd>NvimTreeFindFile<cr>' },
  },
  config = function()
    -- vim.keymap.set('n', '<leader>N', ':Lexplore %:p:h<cr>')
    -- vim.keymap.set('n', '<leader>n', ':Lexplore<cr>')

    require('nvim-tree').setup({})
  end,
}
