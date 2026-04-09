return {
  --   'oskarnurm/koda.nvim',
  --   lazy = false, -- make sure we load this during startup if it is your main colorscheme
  --   priority = 1000, -- make sure to load this before all the other start plugins
  --   config = function()
  --     -- require("koda").setup({ transparent = true })
  --     vim.cmd('colorscheme koda-light')
  --   end,

  'miikanissi/modus-themes.nvim',
  priority = 1000,
  config = function()
    require('modus-themes').setup({
      line_nr_column_background = false,
      sign_column_background = false,
    })

    vim.cmd.colorscheme('modus_operandi')
  end,

  --   'neanias/everforest-nvim',
  --   version = false,
  --   lazy = false,
  --   priority = 1000,
  --   config = function()
  --     require('everforest').setup({
  --       background = 'hard',
  --     })
  --     vim.cmd.colorscheme('everforest')
  --   end,

  --   'jaytyrrell13/paramount.nvim',
  --   lazy = false,
  --   config = function()
  --     vim.cmd.colorscheme('paramount')
  --   end,

  --   'rmehri01/onenord.nvim',
  --   opts = {
  --     disable = {
  --       background = true,
  --     },
  --   },
}
