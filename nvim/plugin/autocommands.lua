-- Highlight when yanking (copying) text
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- Set filetype to astro for .astro files
vim.api.nvim_create_autocmd({ 'BufEnter', 'BufRead' }, {
  pattern = { '*.astro' },
  group = vim.api.nvim_create_augroup('astro-syntax', { clear = true }),
  callback = function()
    vim.cmd('set filetype=astro')
  end,
})

-- Set filetype to html for .blade.php files
vim.api.nvim_create_autocmd({ 'BufEnter', 'BufRead' }, {
  pattern = { '*.blade.php' },
  group = vim.api.nvim_create_augroup('blade-syntax', { clear = true }),
  callback = function()
    vim.cmd('set filetype=html')
  end,
})
