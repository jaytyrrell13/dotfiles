require('telescope').setup{}
require('telescope').load_extension('fzf')

local builtin = require('telescope.builtin')
local bufopts = { noremap=true }

vim.keymap.set('n', '<leader>d', builtin.lsp_definitions, bufopts)
vim.keymap.set('n', '<leader>s', builtin.grep_string, bufopts)
vim.keymap.set('n', '<leader>f', builtin.find_files, bufopts)
vim.keymap.set('n', '<leader>g', builtin.live_grep, bufopts)
vim.keymap.set('n', '<leader>b', builtin.buffers, bufopts)
vim.keymap.set('n', '<leader>s', builtin.lsp_document_symbols, bufopts)
vim.keymap.set('n', '<leader>m', builtin.keymaps, bufopts)
