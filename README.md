# flint-syntax.nvim

The Flint syntax highlighter for Neovim. To add the highlighter to Neovim just add these lines inside your lazyvim setup section like this:

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

That's it, no more setup required than this! By just adding the above line to your `init.lua` file you get:

- Syntax highlighting for Flint files
- Sensible indentation defaults (tab width of 4)
- `commentstring` set to `// %s`, so commenting with `gc` etc. works out of the box
- Automatic LSP setup: if `fls` is in your PATH, it is started automatically for Flint buffers

## Configuration

The defaults can be tweaked from anywhere in your config (e.g. your `init.lua`) before a Flint file is opened:

```lua
-- Use a different server binary (e.g. a debug build)
vim.g.fls_cmd = { 'fls-debug' }

-- Disable the automatic LSP setup entirely
vim.g.flint_syntax_lsp = false
```

If you want to configure the LSP yourself, set `vim.g.flint_syntax_lsp = false` and set it up manually as before.
