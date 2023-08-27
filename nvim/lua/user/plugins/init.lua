return {
  {
    'rmehri01/onenord.nvim',
    config = function()
      local c = require('onenord.colors.onenordlight')
      require('onenord').setup({
        disable = {
          background = true,
        },
        custom_highlights = {
          ['IlluminatedWordText'] = { fg = c.blue, bg = c.selection },
          ['IlluminatedWordRead'] = { fg = c.blue, bg = c.selection },
          ['IlluminatedWordWrite'] = { fg = c.blue, bg = c.selection },
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

  {
    'RRethy/vim-illuminate',
    event = { 'BufReadPost', 'BufNewFile' },
    opts = {
      delay = 200,
      large_file_cutoff = 2000,
      large_file_overrides = {
        providers = { 'lsp' },
      },
      filetypes_denylist = {
        'fugitive',
        'TelescopePrompt',
        'TelescopeResults',
      },
    },
    config = function(_, opts)
      require('illuminate').configure(opts)
    end,
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
        route_info = {
          enable = false,
        },
      })
      require('telescope').load_extension('laravel')
    end,
  },
}
