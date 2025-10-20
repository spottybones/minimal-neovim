-- ┌────────────────────┐
-- │ LSP config example │
-- └────────────────────┘
--
-- This file contains configuration of 'lua_ls' language server.
-- Source: https://github.com/LuaLS/lua-language-server
--
-- It is used by `:h vim.lsp.enable()` and `:h vim.lsp.config()`.
-- See `:h vim.lsp.Config` and `:h vim.lsp.ClientConfig` for all available fields.
--
-- This config is designed for Lua's activity around Neovim. It provides only
-- basic config and can be further improved.

local globals = {
  "vim",
  "MiniDeps",
  "MiniBasics",
  "MiniCompletion",
  "MiniExtra",
  "MiniFiles",
  "MiniIcons",
  "MiniKeymap",
  "MiniMax",
  "MiniMisc",
}

return {
  on_attach = function(client, buf_id)
    -- Reduce very long list of triggers for better 'mini.completion' experience
    client.server_capabilities.completionProvider.triggerCharacters = { ".", ":", "#", "(" }
  end,
  -- LuaLS Structure of these settings comes from LuaLS, not Neovim
  settings = {
    Lua = {
      -- Define runtime properties. Use 'LuaJIT', as it is built into Neovim.
      runtime = { version = "LuaJIT", path = vim.split(package.path, ";") },
      diagnostics = { globals = globals },
      workspace = {
        -- Don't analyze code from submodules
        ignoreSubmodules = true,
        -- Add Neovim's methods for easier code writing
        library = { vim.env.VIMRUNTIME },
      },
    },
  },
}
