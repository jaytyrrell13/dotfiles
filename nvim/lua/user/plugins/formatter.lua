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
          }
        end,

        vue = {
          require('formatter.defaults').eslint,
        },
      },
    })
  end,
}
