return {
  'mfussenegger/nvim-lint',
  lazy = false,
  config = function()
    require('lint').linters_by_ft = {
      typescript = { 'eslint' },
      typescriptreact = { 'eslint' },
    }
  end,
}
