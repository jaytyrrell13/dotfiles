return {
  'nvim-treesitter/nvim-treesitter',
  branch = 'main',
  build = function()
    require('nvim-treesitter.install').update({ with_sync = true })
  end,
  dependencies = {
    'JoosepAlviste/nvim-ts-context-commentstring',
    'nvim-treesitter/nvim-treesitter-textobjects',
  },
  opts = {
    textobjects = {
      select = {
        enable = true,
        lookahead = true,
        keymaps = {
          ['if'] = '@function.inner',
          ['af'] = '@function.outer',
          ['ia'] = '@parameter.inner',
          ['aa'] = '@parameter.outer',
          ['ic'] = '@class.inner',
          ['ac'] = '@class.outer',
        },
      },
      move = {
        enable = true,
        set_jumps = true,
        goto_next_start = {
          [']m'] = '@function.outer',
        },
        goto_next_end = {
          [']M'] = '@function.outer',
        },
        goto_previous_start = {
          ['[m'] = '@function.outer',
        },
        goto_previous_end = {
          ['[M'] = '@function.outer',
        },
      },
      swap = {
        enable = true,
        swap_next = {
          ['<leader>a'] = '@parameter.inner',
        },
        swap_prev = {
          ['<leader>A'] = '@parameter.inner',
        },
      },
    },
  },
  init = function()
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

    vim.api.nvim_create_autocmd('FileType', {
      callback = function()
        -- Enable treesitter highlighting and disable regex syntax
        pcall(vim.treesitter.start)
        -- Enable treesitter-based indentation
        vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
      end,
    })
  end,
}
