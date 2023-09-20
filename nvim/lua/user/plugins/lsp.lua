return {
  'neovim/nvim-lspconfig',
  dependencies = {
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',
    'b0o/schemastore.nvim',
  },
  config = function()
    -- Setup Mason to automatically install LSP servers
    require('mason').setup()
    require('mason-lspconfig').setup({ automatic_installation = true })

    local opts = { noremap = true }
    vim.keymap.set('n', '<leader>o', vim.diagnostic.open_float, opts)
    vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
    vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
    vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
    vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)

    vim.diagnostic.config({
      float = {
        format = function(diagnostic)
          if
            diagnostic.user_data ~= nil
            and diagnostic.user_data.lsp ~= nil
            and diagnostic.user_data.lsp.code ~= nil
          then
            return string.format('%s: %s', diagnostic.user_data.lsp.code, diagnostic.message)
          end
          return diagnostic.message
        end,
      },
    })

    local capabilities = require('cmp_nvim_lsp').default_capabilities()

    require('lspconfig').phpactor.setup({
      capabilities = capabilities,
    })

    require('lspconfig').jsonls.setup({
      capabilities = capabilities,
      settings = {
        json = {
          schemas = require('schemastore').json.schemas(),
        },
      },
    })

    require('lspconfig').tailwindcss.setup({
      capabilities = capabilities,
    })

    require('lspconfig').lua_ls.setup({
      capabilities = capabilities,
      settings = {
        Lua = {
          runtime = {
            -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
            version = 'LuaJIT',
          },
          diagnostics = {
            -- Get the language server to recognize the `vim` global
            globals = { 'vim' },
          },
          workspace = {
            -- Make the server aware of Neovim runtime files
            library = vim.api.nvim_get_runtime_file('', true),
            checkThirdParty = false,
          },
          -- Do not send telemetry data containing a randomized but unique identifier
          telemetry = {
            enable = false,
          },
        },
      },
    })
  end,
}
