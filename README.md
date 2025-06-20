# flint-syntax.nvim

The Flint syntax highlighter for Neovim. To add the highlighter to Neovim just add these lines inside your lazyvim setup section like this:

```lua
require('lazy').setup({
    -- ...
    {
        'flint-lang/flint-syntax.nvim'
        ft = 'flint',
    },
    -- ...
})
```

That's it, no more setup required than this!
