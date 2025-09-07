# flint-syntax.nvim

The Flint syntax highlighter for Neovim. To add the highlighter to Neovim just add these lines inside your lazyvim setup section like this:

```lua
require('lazy').setup({
  -- ...
  {
    'flint-lang/flint-syntax.nvim',
    ft = 'flint',
    config = function()
      -- Set the tab width to 4
      vim.cmd [[
          augroup flint_indent
            autocmd!
            autocmd FileType flint setlocal tabstop=4 shiftwidth=4 noexpandtab
          augroup END
      ]]

      -- LSP configuration
      local lspconfig = require 'lspconfig'
      local configs = require 'lspconfig.configs'

      -- Define flint LSP if not already defined
      if not configs.flint then
        configs.flint = {
          default_config = {
            cmd = { 'fls' }, -- Make sure this is in your PATH
            filetypes = { 'flint' },
            root_dir = function(fname)
              return lspconfig.util.find_git_ancestor(fname) or vim.fn.getcwd()
            end,
            settings = {},
          },
          docs = {
            description = [[
Flint Language Server Protocol implementation.
Make sure 'fls' is in your PATH.
            ]],
          },
        }
      end

      -- Setup the LSP
      lspconfig.flint.setup {}
    end,
  },
  -- ...
})
```

That's it, no more setup required than this! By just adding the above code to your `init.lua` file you not only have added syntax highlighting support for Flint but also set up the `fls` too. Note that you need to have the `fls` installed for it to work, so it needs to be in your PATH variable.
