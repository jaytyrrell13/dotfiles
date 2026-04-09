return {
  'folke/snacks.nvim',
  priority = 1000,
  lazy = false,
  opts = {
    picker = { enabled = true },
  },
  keys = {
    {
      '<leader>sh',
      function()
        Snacks.picker.help()
      end,
    },
    {
      '<leader>sk',
      function()
        Snacks.picker.keymaps()
      end,
    },
    {
      '<leader>sf',
      function()
        Snacks.picker.files({ hidden = true, ignored = true, exclude = { 'vendor', 'node_modules' } })
      end,
    },
    {
      '<leader>gl',
      function()
        Snacks.picker.git_log()
      end,
    },
    {
      '<leader>gf',
      function()
        Snacks.picker.git_log_file()
      end,
    },
    {
      '<leader>sw',
      function()
        Snacks.picker.grep_word()
      end,
    },
    {
      '<leader>sg',
      function()
        Snacks.picker.grep()
      end,
    },
    {
      '<leader>sb',
      function()
        Snacks.picker.buffers()
      end,
    },
    {
      '<leader>ss',
      function()
        Snacks.picker.lsp_symbols()
      end,
    },
  },
}
