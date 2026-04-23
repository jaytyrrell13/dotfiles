vim.lsp.config['phpantom'] = {
  cmd = { '/Users/jay/phpantom_lsp' },
  filetypes = { 'php' },
  root_markers = { 'composer.json', '.git' },
}
vim.lsp.enable('phpantom')

vim.lsp.config('gopls', {
  settings = {
    gopls = {
      gofumpt = true,
    },
  },
})

vim.lsp.enable({
  'gopls',
  'lua_ls',
})

-- vim.diagnostic.config({ virtual_text = true })
vim.diagnostic.config({
  jump = { float = true },
  float = {
    format = function(diagnostic)
      if diagnostic.user_data ~= nil and diagnostic.user_data.lsp ~= nil and diagnostic.user_data.lsp.code ~= nil then
        return string.format('%s: %s', diagnostic.user_data.lsp.code, diagnostic.message)
      end
      return diagnostic.message
    end,
  },
})
