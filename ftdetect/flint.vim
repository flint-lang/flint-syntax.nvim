" ftdetect/flint.vim
augroup flint_filetype
  autocmd!
  " any file ending in .ft is Flint
  autocmd BufRead,BufNewFile *.ft setfiletype flint
augroup END
