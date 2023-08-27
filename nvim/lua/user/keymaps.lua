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

vim.keymap.set('n', '<leader>N', ':Lexplore %:p:h<cr>')
vim.keymap.set('n', '<leader>n', ':Lexplore<cr>')

vim.keymap.set('t', '<esc>', '<C-\\><C-n>')
