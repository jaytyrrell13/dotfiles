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

  'sheerun/vim-polyglot',
  'tpope/vim-commentary',
  'tpope/vim-unimpaired',

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

  {
    'adalessa/laravel.nvim',
    dependencies = {
      'nvim-telescope/telescope.nvim',
      'tpope/vim-dotenv',
      'MunifTanjim/nui.nvim',
    },
    cmd = { 'Sail', 'Artisan', 'Composer', 'Npm', 'Yarn', 'Laravel' },
    keys = {
      { '<leader>la', ':Laravel artisan<cr>' },
      { '<leader>lr', ':Laravel routes<cr>' },
      {
        '<leader>lt',
        function()
          require('laravel.tinker').send_to_tinker()
        end,
        mode = 'v',
        desc = 'Laravel Application Routes',
      },
    },
    event = { 'VeryLazy' },
    config = function()
      require('laravel').setup({
        features = {
          route_info = {
            enable = false,
          },
        },
      })
      require('telescope').load_extension('laravel')
    end,
  },
}
