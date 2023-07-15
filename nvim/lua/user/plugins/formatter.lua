return {
  'mhartington/formatter.nvim',
  config = function()
    require('formatter').setup({
      filetype = {
        lua = {
          require('formatter.filetypes.lua').stylua,
        },

        php = function()
          return {
            exe = './vendor/bin/pint',
            stdin = true,
          }
        end,

        vue = {
          require('formatter.defaults').eslint_d,
        },
      },
    })
  end,
}
