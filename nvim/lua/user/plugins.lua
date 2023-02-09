local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

-- Initialize packer
require('packer').init({
  compile_path = vim.fn.stdpath('data') .. '/site/plugin/packer_compiled.lua',
  display = {
    open_fn = function()
      return require('packer.util').float({ border = 'solid' })
    end,
  },
})

-- Install plugins
local use = require('packer').use

use({
  'wbthomason/packer.nvim',
  config = function()
    vim.keymap.set('n', '<leader>pi', '<cmd>PackerSync<cr>')
  end
})

use({
  'rmehri01/onenord.nvim',
  config = function()
    require('onenord').setup()
  end
})

use 'sheerun/vim-polyglot'

use({
  'tpope/vim-fugitive',
  config = function()
    require('user.plugins.fugitive')
  end
})

use 'tpope/vim-commentary'
use 'tpope/vim-surround'
use 'tpope/vim-unimpaired'
use 'AndrewRadev/splitjoin.vim'

use({
  'vim-test/vim-test',
  config = function()
    require('user.plugins.vimtest')
  end,
})

use({
  'windwp/nvim-autopairs',
  config = function()
    require('nvim-autopairs').setup()
  end
})

use({
  'neovim/nvim-lspconfig',
  config = function()
    require('user.plugins.lspconfig')
  end
})

use 'b0o/schemastore.nvim'

use({
  'nvim-lualine/lualine.nvim',
  requires = 'kyazdani42/nvim-web-devicons',
  config = function()
    require('user.plugins.lualine')
  end,
})

use({
  'nvim-telescope/telescope.nvim',
  requires = {
    { 'nvim-lua/plenary.nvim' },
    { 'kyazdani42/nvim-web-devicons' },
    { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' },
    { 'nvim-telescope/telescope-live-grep-args.nvim' },
  },
  config = function()
    require('user.plugins.telescope')
  end,
})

use({
  'nvim-treesitter/nvim-treesitter',
  run = function ()
    require('nvim-treesitter.install').update({ with_sync = true })
  end,
  requires = {
    'JoosepAlviste/nvim-ts-context-commentstring',
    'nvim-treesitter/nvim-treesitter-textobjects'
  },
  config = function()
    require('user.plugins.treesitter')
  end,
})

use({
  'L3MON4D3/LuaSnip',
  config = function()
    require('user.plugins.luasnip')
  end,
})

use({
  'hrsh7th/nvim-cmp',
  requires = {
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-cmdline',
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-nvim-lsp-signature-help',
    'hrsh7th/cmp-nvim-lua',
    'onsails/lspkind-nvim',
    'saadparwaiz1/cmp_luasnip',
  },
  config = function()
    require('user.plugins.cmp')
  end,
})

-- Automatically install plugins on first run
if packer_bootstrap then
  require('packer').sync()
end

-- Automatically regenerate compiled loader file on save
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])
