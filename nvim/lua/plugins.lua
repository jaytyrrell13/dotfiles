vim.pack.add({
  { src = 'https://github.com/mason-org/mason.nvim' },
  { src = 'https://github.com/saghen/blink.cmp', version = vim.version.range('^1') },
  { src = 'https://github.com/miikanissi/modus-themes.nvim' },
  { src = 'https://github.com/tpope/vim-fugitive' },
  { src = 'https://github.com/folke/snacks.nvim' },
  { src = 'https://github.com/nvim-tree/nvim-web-devicons' },
  { src = 'https://github.com/nvim-mini/mini.nvim' },
  { src = 'https://github.com/nvim-treesitter/nvim-treesitter' },
  { src = 'https://github.com/stevearc/conform.nvim' },
  { src = 'https://github.com/vim-test/vim-test' },
})

require('mason').setup({})

require('blink.cmp').setup({
  fuzzy = { implementation = 'prefer_rust_with_warning' },
  signature = { enabled = true },
  keymap = {
    preset = 'default',
    ['<C-l>'] = { 'snippet_forward', 'fallback' },
    ['<C-h>'] = { 'snippet_backward', 'fallback' },
  },

  appearance = {
    use_nvim_cmp_as_default = true,
    nerd_font_variant = 'normal',
  },

  completion = {
    documentation = {
      auto_show = true,
      auto_show_delay_ms = 200,
    },
  },

  cmdline = {
    keymap = { preset = 'inherit' },
    completion = { menu = { auto_show = true } },
  },

  sources = { default = { 'lsp', 'snippets' } },
})

require('modus-themes').setup({
  line_nr_column_background = false,
  sign_column_background = false,
  on_colors = function() end,
  on_highlights = function() end,
})

vim.cmd.colorscheme('modus_operandi')

require('snacks').setup({
  picker = { enabled = true },
  explorer = { enabled = true },
})

require('mini.ai').setup({
  mappings = {
    around_next = 'aa',
    inside_next = 'ii',
  },
})
require('mini.comment').setup()
require('mini.diff').setup()
require('mini.git').setup()
require('mini.icons').setup()
require('mini.pairs').setup()
require('mini.statusline').setup()
require('mini.surround').setup()

local ensureInstalled = {
  'astro',
  'comment',
  'css',
  'dockerfile',
  'git_config',
  'git_rebase',
  'gitcommit',
  'gitignore',
  'go',
  'gomod',
  'gosum',
  'html',
  'javascript',
  'json',
  'lua',
  'markdown',
  'markdown_inline',
  'php',
  'query',
  'regex',
  'ruby',
  'sql',
  'twig',
  'typescript',
  'vue',
  'xml',
}

local alreadyInstalled = require('nvim-treesitter.config').get_installed()
local parsersToInstall = vim
  .iter(ensureInstalled)
  :filter(function(parser)
    return not vim.tbl_contains(alreadyInstalled, parser)
  end)
  :totable()
require('nvim-treesitter').install(parsersToInstall)

require('conform').setup({
  formatters_by_ft = {
    lua = { 'stylua' },
    php = { 'pint' },
    go = { 'gofumpt' },
  },
  default_format_opts = {
    lsp_format = 'fallback',
  },
  format_on_save = { timeout_ms = 500 },
})
