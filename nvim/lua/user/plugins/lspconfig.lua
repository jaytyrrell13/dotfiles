-- Setup Mason to automatically install LSP servers
require('mason').setup()
require('mason-lspconfig').setup({ automatic_installation = true })
require('user.plugins.lsp.keymaps')
require('user.plugins.lsp.diagnostic')

local capabilities = require('cmp_nvim_lsp').default_capabilities()

local on_attach = require('user.plugins.lsp.on_attach')

require('lspconfig').intelephense.setup({
  on_attach = on_attach,
  capabilities = capabilities,
})

require('lspconfig').jsonls.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  settings = {
    json = {
      schemas = require('schemastore').json.schemas(),
    },
  },
})

require('lspconfig').lua_ls.setup({
  on_attach = on_attach,
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
      },
      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry = {
        enable = false,
      },
    },
  },
})

require('lspconfig').rust_analyzer.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = {
    'rustup',
    'run',
    'stable',
    'rust-analyzer',
  },
})

require('null-ls').setup({
  sources = {
    -- Code Actions
    require('null-ls').builtins.code_actions.eslint_d.with({
      condition = function(utils)
        return utils.root_has_file({ '.eslintrc.js' })
      end,
    }),

    -- Diagnostics
    require('null-ls').builtins.diagnostics.eslint_d.with({
      condition = function(utils)
        return utils.root_has_file({ '.eslintrc.js' })
      end,
    }),

    -- Formatting
    require('null-ls').builtins.formatting.stylua.with({
      extra_args = { '--config-path', vim.fn.expand('~/.config/nvim/.stylua.toml') },
    }),
    require('null-ls').builtins.formatting.eslint_d.with({
      condition = function(utils)
        return utils.root_has_file({ '.eslintrc.js' })
      end,
    }),
  },
  on_attach = on_attach,
})
require('mason-null-ls').setup({ automatic_installation = true })
