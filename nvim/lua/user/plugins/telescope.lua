return {
  'nvim-telescope/telescope.nvim',
  dependencies = {
    { 'nvim-lua/plenary.nvim' },
    { 'kyazdani42/nvim-web-devicons' },
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
    { 'nvim-telescope/telescope-live-grep-args.nvim' },
  },
  config = function()
    require('telescope').load_extension('fzf')
    require('telescope').load_extension('live_grep_args')
    require('telescope').setup({
      pickers = {
        buffers = {
          mappings = {
            i = {
              ['<C-x>'] = 'delete_buffer',
            },
          },
        },
      },
    })

    local builtin = require('telescope.builtin')
    local extensions = require('telescope').extensions

    vim.keymap.set(
      'n',
      '<leader>d',
      builtin.lsp_definitions,
      { noremap = true, desc = 'telescope.builtin.lsp_definitions' }
    )
    vim.keymap.set('n', '<leader>s', builtin.grep_string, { noremap = true, desc = 'telescope.builtin.grep_string' })
    vim.keymap.set('n', '<leader>f', builtin.find_files, { noremap = true, desc = 'telescope.builtin.find_files' })
    vim.keymap.set(
      'n',
      '<leader>g',
      extensions.live_grep_args.live_grep_args,
      { noremap = true, desc = 'telescope.extensions.live_grep_args' }
    )
    vim.keymap.set('n', '<leader>b', builtin.buffers, { noremap = true, desc = 'telescope.builtin.buffers' })
    vim.keymap.set(
      'n',
      '<leader>r',
      builtin.lsp_document_symbols,
      { noremap = true, desc = 'telescope.builtin.lsp_document_symbols' }
    )
    vim.keymap.set(
      'n',
      '<leader>R',
      builtin.lsp_references,
      { noremap = true, desc = 'telescope.builtin.lsp_references' }
    )
    vim.keymap.set('n', '<leader>m', builtin.keymaps, { noremap = true, desc = 'telescope.builtin.keymaps' })
    vim.keymap.set('n', '<leader>h', builtin.oldfiles, { noremap = true, desc = 'telescope.builtin.oldfiles' })
    vim.keymap.set('n', '<leader>ev', function()
      builtin.find_files({ cwd = '~/.config/nvim' })
    end, { noremap = true, desc = 'telescope.builtin.find_files for nvim config' })
    vim.keymap.set(
      'n',
      '<leader>a',
      extensions.artisan.artisan,
      { noremap = true, desc = 'telescope.extensions.artisan' }
    )
  end,
}
