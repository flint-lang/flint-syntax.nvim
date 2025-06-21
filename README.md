# flint-syntax.nvim

The Flint syntax highlighter for Neovim. To add the highlighter to Neovim just add these lines inside your lazyvim setup section like this:

```lua
require('lazy').setup({
    -- ...
    {
        'flint-lang/flint-syntax.nvim'
        ft = 'flint',
        -- Set the tab width to 4
        init = function()
          vim.cmd [[
            augroup flint_indent
              autocmd!
              autocmd FileType flint setlocal tabstop=4 shiftwidth=4
            augroup END
          ]]
        end,
    },
    -- ...
})
```

That's it, no more setup required than this!
