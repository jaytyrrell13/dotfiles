vim.cmd([[
  augroup RemoveTrailingSpaces
    autocmd!
    autocmd BufWritePre * :%s/\s\+$//e
  augroup END
]])
