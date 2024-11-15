return {
  'voldikss/vim-floaterm',
  cmd = { 'FloatermToggle', 'FloatermNew' },
  keys = {
    { '<leader>T', ':FloatermToggle<cr>', mode = 'n' },
    { '<leader>T', '<C-\\><C-n>:FloatermToggle<cr>', mode = 't' },
  },
  config = function()
    vim.cmd([[
      let g:floaterm_width = 0.8
      let g:floaterm_height = 0.8

      " FG Color from onenord
      let g:terminal_color_0 = '#2e3440'
    ]])
  end,
}
