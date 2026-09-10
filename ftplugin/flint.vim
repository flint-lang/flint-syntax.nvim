" ftplugin/flint.vim
" Vim-flavored ftplugin. Neovim uses ftplugin/flint.lua instead (this file is a
" no-op there). Keep the buffer settings in sync with flint.lua.
if exists("b:did_ftplugin")
  finish
endif
if has("nvim")
  finish
endif
let b:did_ftplugin = 1

" Indentation: Flint is conventionally indented with a tab width of 4
setlocal tabstop=4
setlocal shiftwidth=4
setlocal softtabstop=4
setlocal noexpandtab

" Comments start with '//' (block comments use /* */)
setlocal commentstring=//\ %s

let b:undo_ftplugin = 'setlocal tabstop< shiftwidth< softtabstop< expandtab< commentstring<'