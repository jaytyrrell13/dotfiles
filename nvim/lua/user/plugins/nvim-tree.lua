return {
  'nvim-tree/nvim-tree.lua',
  version = '*',
  lazy = false,
  enabled = false,
  dependencies = 'kyazdani42/nvim-web-devicons',
  keys = {
    { '<leader>n', '<cmd>NvimTreeToggle<cr>' },
    { '<leader>N', '<cmd>NvimTreeFindFile<cr>' },
  },
  config = function()
    require('nvim-tree').setup({})
  end,
}
