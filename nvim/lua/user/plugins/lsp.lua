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
    local lspconfig = require('lspconfig')
    -- Setup Mason to automatically install LSP servers
    require('mason').setup()
    require('mason-lspconfig').setup({ automatic_installation = true })

    vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float)
    vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
    vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
    vim.keymap.set('n', '<leader>c', vim.diagnostic.setqflist)

    vim.api.nvim_create_autocmd('LspAttach', {
      group = vim.api.nvim_create_augroup('UserLspConfig', {}),
      callback = function(ev)
        local opts = { buffer = ev.buf }
        vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
        vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
        vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
        vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
        vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
        vim.keymap.set('n', '<space>wl', function()
          print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
        end, opts)
        vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
        vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
        vim.keymap.set({ 'n', 'v' }, '<space>a', vim.lsp.buf.code_action, opts)
        vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
      end,
    })

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

    lspconfig.phpactor.setup({
      capabilities = capabilities,
      init_options = {
        ['language_server_phpstan.enabled'] = false,
        ['language_server_psalm.enabled'] = false,
      },
    })

    lspconfig.jsonls.setup({
      capabilities = capabilities,
      settings = {
        json = {
          schemas = require('schemastore').json.schemas(),
        },
      },
    })

    lspconfig.astro.setup({
      capabilities = capabilities,
    })

    lspconfig.tailwindcss.setup({
      capabilities = capabilities,
    })

    lspconfig.lua_ls.setup({
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
