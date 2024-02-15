return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig")
    end,
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      local capabilities = require('cmp_nvim_lsp').default_capabilities()
      require("neodev").setup({})
      require("lspconfig").lua_ls.setup { capabilities = capabilities
      , settings = {
        Lua = {
          completion = {
            callSnippet = "Replace"
          }
        }
      } }
      require 'lspconfig'.pyright.setup { capabilities = capabilities }
      require 'lspconfig'.html.setup { capabilities = capabilities }
      require 'lspconfig'.clangd.setup { capabilities = capabilities }
    end,
  }
}
