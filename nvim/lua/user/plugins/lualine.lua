return {
  'nvim-lualine/lualine.nvim',
  dependencies = 'kyazdani42/nvim-web-devicons',
  opts = {
    options = {
      theme = 'onenord',
      section_separators = '',
      component_separators = '',
    },
    sections = {
      lualine_x = {},
    },
  },
}
