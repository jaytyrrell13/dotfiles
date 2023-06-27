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
