vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.keymap.set('n', '<leader>N', ':Lexplore %:p:h<cr>')
vim.keymap.set('n', '<leader>n', ':Lexplore<cr>')

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

-- Move text up and down
vim.keymap.set('i', '<C-j>', '<Esc>:move .+1<CR>==gi')
vim.keymap.set('i', '<C-k>', '<Esc>:move .-2<CR>==gi')
vim.keymap.set('x', '<C-j>', ":move '>+1<CR>gv-gv")
vim.keymap.set('x', '<C-k>', ":move '<-2<CR>gv-gv")

-- Reselect visual selection after indenting
vim.keymap.set('v', '<', '<gv')
vim.keymap.set('v', '>', '>gv')
