return {
  'nvim-telescope/telescope.nvim',
  dependencies = {
    { 'nvim-lua/plenary.nvim' },
    { 'kyazdani42/nvim-web-devicons' },
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
    { 'nvim-telescope/telescope-live-grep-args.nvim' },
    { 'jaytyrrell13/telescope-artisan.nvim' },
  },
  config = function()
    require('telescope').load_extension('fzf')
    require('telescope').load_extension('live_grep_args')
    require('telescope').load_extension('artisan')
    require('telescope').setup({
      pickers = {
        buffers = {
          mappings = {
            i = {
              ['<C-q>'] = 'delete_buffer',
            },
          },
        },
      },
    })

    local builtin = require('telescope.builtin')
    local extensions = require('telescope').extensions

    vim.keymap.set('n', '<leader>sh', builtin.help_tags, { desc = '[S]earch [H]elp' })
    vim.keymap.set('n', '<leader>sk', builtin.keymaps, { desc = '[S]earch [K]eymaps' })
    vim.keymap.set('n', '<leader>sf', builtin.find_files, { desc = '[S]earch [F]iles' })
    vim.keymap.set('n', '<leader>sw', builtin.grep_string, { desc = '[S]earch current [W]ord' })
    vim.keymap.set('n', '<leader>sg', extensions.live_grep_args.live_grep_args, { desc = '[S]earch by [G]rep Args' })
    vim.keymap.set('n', '<leader>sd', builtin.diagnostics, { desc = '[S]earch [D]iagnostics' })
    vim.keymap.set('n', '<leader>sr', builtin.resume, { desc = '[S]earch [R]esume' })
    vim.keymap.set('n', '<leader>so', builtin.oldfiles, { desc = '[S]earch Recent Files ("o" for old files)' })
    vim.keymap.set('n', '<leader>sb', builtin.buffers, { desc = '[S]earch [B]uffers' })
    vim.keymap.set('n', '<leader>sa', extensions.artisan.artisan, { desc = '[S]earch [A]rtisan' })

    -- Slightly advanced example of overriding default behavior and theme
    vim.keymap.set('n', '<leader>/', function()
      -- You can pass additional configuration to Telescope to change the theme, layout, etc.
      builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown({
        previewer = false,
      }))
    end, { desc = '[/] Fuzzily search in current buffer' })

    -- Shortcut for searching your Neovim configuration files
    vim.keymap.set('n', '<leader>sn', function()
      builtin.find_files({ cwd = vim.fn.stdpath('config') })
    end, { desc = '[S]earch [N]eovim files' })

    -- vim.keymap.set('n', '<leader>s', builtin.grep_string, { noremap = true, desc = 'telescope.builtin.grep_string' })
    -- vim.keymap.set('n', '<leader>f', builtin.find_files, { noremap = true, desc = 'telescope.builtin.find_files' })
    -- vim.keymap.set('n', '<leader>F', function()
    --   require('telescope.builtin').find_files({ no_ignore = true, hidden = true, prompt_title = 'All Files' })
    -- end, { noremap = true, desc = 'telescope.builtin.find_files all' })
    -- vim.keymap.set(
    --   'n',
    --   '<leader>ga',
    --   extensions.live_grep_args.live_grep_args,
    --   { noremap = true, desc = 'telescope.extensions.live_grep_args' }
    -- )
    -- vim.keymap.set('n', '<leader>b', builtin.buffers, { noremap = true, desc = 'telescope.builtin.buffers' })
    -- vim.keymap.set(
    --   'n',
    --   '<leader>r',
    --   builtin.lsp_document_symbols,
    --   { noremap = true, desc = 'telescope.builtin.lsp_document_symbols' }
    -- )
    -- vim.keymap.set(
    --   'n',
    --   '<leader>R',
    --   builtin.lsp_references,
    --   { noremap = true, desc = 'telescope.builtin.lsp_references' }
    -- )
    -- vim.keymap.set('n', '<leader>m', builtin.keymaps, { noremap = true, desc = 'telescope.builtin.keymaps' })
    -- vim.keymap.set('n', '<leader>h', builtin.oldfiles, { noremap = true, desc = 'telescope.builtin.oldfiles' })
    -- vim.keymap.set('n', '<leader>ev', function()
    --   builtin.find_files({ cwd = '~/.config/nvim' })
    -- end, { noremap = true, desc = 'telescope.builtin.find_files for nvim config' })
  end,
}
