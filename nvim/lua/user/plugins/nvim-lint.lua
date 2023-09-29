return {
  'mfussenegger/nvim-lint',
  lazy = false,
  config = function()
    require('lint').linters_by_ft = {
      javascript = { 'eslint_d' },
      typescript = { 'eslint_d' },
      typescriptreact = { 'eslint_d' },
      vue = { 'eslint_d' },
      astro = { 'eslint_d' },
    }
  end,
}
