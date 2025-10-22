return {
  'neovim/nvim-lspconfig',
  dependencies = {
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',
    'b0o/schemastore.nvim',
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
        vim.keymap.set('n', '<space>k', vim.lsp.buf.signature_help, opts)
        vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
        vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
        vim.keymap.set('n', '<space>wl', function()
          print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
        end, opts)
        vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
        vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
        vim.keymap.set({ 'n', 'v' }, '<space>C', vim.lsp.buf.code_action, opts)
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

    vim.lsp.config('phpactor', {
      capabilities = capabilities,
      init_options = {
        ['language_server_phpstan.enabled'] = false,
        ['language_server_psalm.enabled'] = false,
      },
    })
    vim.lsp.enable('phpactor')

    vim.lsp.config('jsonls', {
      capabilities = capabilities,
      settings = {
        json = {
          schemas = require('schemastore').json.schemas(),
        },
      },
    })

    vim.lsp.config('eslint', {
      capabilities = capabilities,
      on_attach = function(client, bufnr)
        vim.api.nvim_create_autocmd('BufWritePre', {
          buffer = bufnr,
          command = 'EslintFixAll',
        })
      end,
    })
    vim.lsp.enable('eslint')

    vim.lsp.config('gopls', {
      capabilities = capabilities,
      settings = {
        gopls = {
          gofumpt = true,
        },
      },
    })
    vim.lsp.enable('gopls')

    vim.lsp.config('astro', {
      capabilities = capabilities,
    })
    vim.lsp.enable('astro')

    vim.lsp.config('ts_ls', {
      capabilities = capabilities,
    })
    vim.lsp.enable('ts_ls')

    vim.lsp.config('tailwindcss', {
      capabilities = capabilities,
    })
    vim.lsp.enable('tailwindcss')

    vim.lsp.config('lua_ls', {
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
    vim.lsp.enable('lua_ls')
  end,
}
