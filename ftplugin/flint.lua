-- ftplugin/flint.lua
if vim.b.did_ftplugin then
  return
end
vim.b.did_ftplugin = true

-- Indentation: Flint is conventionally indented with a tab width of 4
vim.opt_local.tabstop = 4
vim.opt_local.shiftwidth = 4
vim.opt_local.softtabstop = 4
vim.opt_local.expandtab = false

-- Comments start with '//' (block comments use /* */)
vim.opt_local.commentstring = '// %s'

vim.b.undo_ftplugin = 'setlocal tabstop< shiftwidth< softtabstop< expandtab< commentstring<'

-- LSP setup. Sensible defaults are applied automatically:
--   * disable entirely with `vim.g.flint_syntax_lsp = false`
--   * override the server command with `vim.g.fls_cmd = { 'fls-debug' }`
if vim.g.flint_syntax_lsp == false then
  return
end

local cmd = vim.g.fls_cmd or { 'fls' }

if vim.fn.executable(cmd[1]) == 0 then
  if not vim.g.__flint_syntax_lsp_notified then
    vim.g.__flint_syntax_lsp_notified = true
    vim.notify(
      ("flint-syntax.nvim: '%s' not found in PATH, not starting the Flint LSP"):format(cmd[1]),
      vim.log.levels.WARN
    )
  end
  return
end

if vim.lsp.config ~= nil then
  -- Native LSP API (Neovim >= 0.11), no nvim-lspconfig required
  vim.lsp.config('flint', {
    cmd = cmd,
    filetypes = { 'flint' },
    root_dir = function(bufnr, callback)
      local fname = vim.api.nvim_buf_get_name(bufnr)
      callback(vim.fs.root(fname, '.git') or vim.fn.getcwd())
    end,
  })
  vim.lsp.enable('flint')
else
  -- Legacy nvim-lspconfig API for older setups
  local ok, lspconfig = pcall(require, 'lspconfig')
  if not ok then
    return
  end

  local configs = require('lspconfig.configs')
  if not configs.flint then
    configs.flint = {
      default_config = {
        cmd = cmd,
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

  lspconfig.flint.setup {}
end
