vim.keymap.set('n', '<leader>w', ':w!<cr>')
vim.keymap.set('n', '<leader>q', ':q<cr>')

-- Close all buffers
vim.keymap.set('n', '<leader>Q', ':bufdo bd<cr>')

-- Keep cursor in the center when going to the next/previous result
vim.keymap.set('n', 'n', 'nzzzv')
vim.keymap.set('n', 'N', 'Nzzzv')

vim.keymap.set('n', '<leader><space>', ':nohlsearch<cr>')

vim.keymap.set('n', '<C-H>', '<C-W><C-H>')
vim.keymap.set('n', '<C-J>', '<C-W><C-J>')
vim.keymap.set('n', '<C-K>', '<C-W><C-K>')
vim.keymap.set('n', '<C-L>', '<C-W><C-L>')

-- Reselect visual selection after indenting
vim.keymap.set('v', '<', '<gv')
vim.keymap.set('v', '>', '>gv')

-- Easy insertion of a trailing ; or , from insert mode
vim.keymap.set('i', ';;', '<esc>A;<esc>')
vim.keymap.set('i', ',,', '<esc>A,<esc>')

vim.keymap.set('t', '<esc>', '<C-\\><C-n>')

-- These mappings control the size of splits (height/width)
vim.keymap.set('n', '<C-,>', '<c-w>5<')
vim.keymap.set('n', '<C-.>', '<c-w>5>')
vim.keymap.set('n', '<C-t>', '<C-W>+')
vim.keymap.set('n', '<C-s>', '<C-W>-')

-- copy/paste
vim.keymap.set('v', '<leader>c', '"*yy<CR>', { noremap = true })
vim.keymap.set('v', '<leader>v', '"+p<CR>', { noremap = true })
vim.keymap.set('n', '<leader>v', '"+p<CR>', { noremap = true })

-- vim-fugitive
vim.keymap.set('n', '<leader>gs', '<cmd>Git<cr>')
vim.keymap.set('n', '<leader>gpl', '<cmd>Git pull<cr>')
vim.keymap.set('n', '<leader>gps', '<cmd>Git push<cr>')
vim.keymap.set('n', '<leader>gb', '<cmd>Git blame<cr>')

-- snacks.nvim
vim.keymap.set('n', '<leader>sh', function()
  require('snacks').picker.help()
end)
vim.keymap.set('n', '<leader>sk', function()
  require('snacks').picker.keymaps()
end)
vim.keymap.set('n', '<leader>sf', function()
  require('snacks').picker.files({ hidden = true, ignored = true, exclude = { 'vendor', 'node_modules' } })
end)
vim.keymap.set('n', '<leader>gl', function()
  require('snacks').picker.git_log()
end)
vim.keymap.set('n', '<leader>gf', function()
  require('snacks').picker.git_log_file()
end)
vim.keymap.set('n', '<leader>sw', function()
  require('snacks').picker.grep_word()
end)
vim.keymap.set('n', '<leader>sg', function()
  require('snacks').picker.grep()
end)
vim.keymap.set('n', '<leader>sb', function()
  require('snacks').picker.buffers()
end)
vim.keymap.set('n', '<leader>ss', function()
  require('snacks').picker.lsp_symbols()
end)

vim.keymap.set('n', '<leader>n', function()
  require('snacks').explorer()
end)
vim.keymap.set('n', '<leader>N', function()
  require('snacks').explorer.reveal()
end)

-- vim-test
vim.keymap.set('n', '<leader>tn', '<cmd>TestNearest<cr>')
vim.keymap.set('n', '<leader>tf', '<cmd>TestFile<cr>')
vim.keymap.set('n', '<leader>ts', '<cmd>TestSuite<cr>')
vim.keymap.set('n', '<leader>tl', '<cmd>TestLast<cr>')
vim.keymap.set('n', '<leader>tv', '<cmd>TestVisit<cr>')
