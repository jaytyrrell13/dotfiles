return {
  'neovim/nvim-lspconfig',
  dependencies = {
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',
    'b0o/schemastore.nvim',
    'nvimtools/none-ls.nvim',
    'jay-babu/mason-null-ls.nvim',
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

    -- local on_attach = function(client, bufnr)
    --   local augroup = vim.api.nvim_create_augroup('LspFormatting', {})

    --   if client.supports_method('textDocument/formatting') then
    --     vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
    --     vim.api.nvim_create_autocmd('BufWritePre', {
    --       group = augroup,
    --       buffer = bufnr,
    --       callback = function()
    --         vim.lsp.buf.format({
    --           filter = function(cl)
    --             return cl.name == 'null-ls'
    --           end,
    --           bufnr = bufnr,
    --         })
    --       end,
    --     })
    --   end
    -- end

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

    local null_ls = require('null-ls')
    local augroup = vim.api.nvim_create_augroup('LspFormatting', {})
    null_ls.setup({
      sources = {
        -- Code Actions
        null_ls.builtins.code_actions.eslint_d.with({
          condition = function(utils)
            return utils.root_has_file({ '.eslintrc.js' })
          end,
        }),

        -- Diagnostics
        null_ls.builtins.diagnostics.eslint_d.with({
          condition = function(utils)
            return utils.root_has_file({ '.eslintrc.js' })
          end,
        }),

        -- Formatting
        null_ls.builtins.formatting.stylua.with({
          extra_args = { '--config-path', vim.fn.expand('~/.config/nvim/.stylua.toml') },
        }),
        null_ls.builtins.formatting.eslint_d.with({
          condition = function(utils)
            return utils.root_has_file({ '.eslintrc.js' })
          end,
        }),
        null_ls.builtins.formatting.trim_whitespace,
        null_ls.builtins.formatting.pint.with({
          condition = function(utils)
            return utils.root_has_file({ 'vendor/bin/pint' })
          end,
        }),
      },
      on_attach = function(client, bufnr)
        if client.supports_method('textDocument/formatting') then
          vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
          vim.api.nvim_create_autocmd('BufWritePre', {
            group = augroup,
            buffer = bufnr,
            callback = function()
              vim.lsp.buf.format({ bufnr = bufnr, timeout_ms = 5000 })
            end,
          })
        end
      end,
    })
  end,
}
