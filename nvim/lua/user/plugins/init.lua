return {
  {
    'rmehri01/onenord.nvim',
    config = function()
      require('onenord').setup({
        disable = {
          background = true,
        },
      })
    end,
  },

  {
    'jaytyrrell13/static.nvim',
    dev = true,
    lazy = false,
    opts = {
      strategy = 'neovim',
    },
    keys = {
      { '<leader>Sb', ':Static build<cr>' },
      { '<leader>Ss', ':Static serve<cr>' },
      { '<leader>Sp', ':Static prod<cr>' },
    },
  },

  'tpope/vim-commentary',

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
