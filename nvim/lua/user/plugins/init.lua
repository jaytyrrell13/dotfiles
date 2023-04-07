return {
  {
    'rmehri01/onenord.nvim',
    config = function()
      require('onenord').setup()
    end,
  },

  'sheerun/vim-polyglot',
  'tpope/vim-commentary',
  'tpope/vim-surround',
  'tpope/vim-unimpaired',
  'AndrewRadev/splitjoin.vim',

  {
    'whatyouhide/vim-textobj-xmlattr',
    dependencies = 'kana/vim-textobj-user',
  },

  {
    'windwp/nvim-autopairs',
    config = function()
      require('nvim-autopairs').setup()
    end,
  },

  {
    'phpactor/phpactor',
    ft = 'php',
    build = 'composer install --no-dev --optimize-autoloader',
    keys = {
      { '<leader>pm', ':PhpactorContextMenu<cr>' },
      { '<leader>pn', ':PhpactorClassNew<cr>' },
    },
  },
}
