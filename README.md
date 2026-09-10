# flint-syntax.nvim

The Flint syntax highlighter for Vim and Neovim.

## Neovim (Lazy)

To add the highlighter to Neovim just add these lines inside your azyvim setup section like this:

```lua
require('lazy').setup({
  -- ...
  {
    'flint-lang/flint-syntax.nvim',
    ft = 'flint',
  },
  -- ...
})
```

That's it, no more setup required than this.

## Vim (native packages)

Vim 8+ loads plugins from `pack/*/start/*` directories automatically. Just clone the repository there:

```sh
git clone https://github.com/flint-lang/flint-syntax.nvim.git ~/.vim/pack/flint-lang/start/flint-syntax.nvim
```

Make sure filetype plugins and syntax highlighting are enabled in your `.vimrc`:

```vim
filetype plugin indent on
syntax on
```

## Vim (vim-plug)

With vim-plug installed, add this to your `.vimrc`:

```vim
filetype plugin indent on
syntax on

call plug#begin()
Plug 'flint-lang/flint-syntax.nvim'
call plug#end()
```

Then run `:PlugInstall`.

## Configuration

The defaults can be tweaked from anywhere in your config (e.g. your `init.lua`) before a Flint file is opened:

```lua
-- Use a different server binary (e.g. a debug build)
vim.g.fls_cmd = { 'fls-debug' }

-- Disable the automatic LSP setup entirely
vim.g.flint_syntax_lsp = false
```

If you want to configure the LSP yourself, set `vim.g.flint_syntax_lsp = false` and set it up manually as before.
