return {
  'mhartington/formatter.nvim',
  enabled = false,
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

        typescript = {
          require('formatter.defaults').prettier,
        },

        typescriptreact = {
          require('formatter.defaults').prettier,
        },
      },
    })
  end,
}
