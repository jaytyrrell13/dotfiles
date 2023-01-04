vim.cmd([[
  augroup RemoveTrailingSpaces
    autocmd!
    autocmd BufWritePre *.php :%s/\s\+$//e
    autocmd BufWritePre *.js :%s/\s\+$//e
    autocmd BufWritePre *.vue :%s/\s\+$//e
  augroup END
]])
