local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

require('lazy').setup('user.plugins', {
  dev = {
    path = '~/Code',
    patterns = { 'jaytyrrell13' },
  },
})

require('user.options')
require('user.keymaps')

local FormatAutogroup = vim.api.nvim_create_augroup('FormatAutogroup', { clear = true })
vim.api.nvim_create_autocmd({ 'BufWritePost' }, {
  group = FormatAutogroup,
  command = 'FormatWrite',
})

local AstroAutogroup = vim.api.nvim_create_augroup('AstroAutogroup', { clear = true })
vim.api.nvim_create_autocmd({ 'BufEnter', 'BufRead' }, {
  pattern = { '*.astro' },
  group = AstroAutogroup,
  callback = function()
    vim.cmd('set filetype=astro')
  end,
})
