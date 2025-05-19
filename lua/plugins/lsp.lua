return {

  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "lua-language-server", -- Install Lua language server
      },
    },
    config = function(_, opts)
      require("mason").setup(opts)
      local mr = require("mason-registry")
      local function ensure_installed()
        for _, tool in ipairs(opts.ensure_installed) do
          local p = mr.get_package(tool)
          if not p:is_installed() then
            p:install() -- Install the tool if it is not already installed
          end
        end
      end
      if mr.refresh then
        mr.refresh(ensure_installed) -- Ensure tools are installed after refreshing the registry
      else
        ensure_installed() -- Directly ensure tools are installed
      end
    end,
  },

  {
    'neovim/nvim-lspconfig',
    dependencies = { 'saghen/blink.cmp' }, -- Add dependencies

    -- Example: Directly call setup for each LSP
    config = function()
      vim.diagnostic.config({
        underline = false, -- Disable underline
        signs = false, -- Disable signs
        update_in_insert = false, -- Do not update diagnostics in insert mode
        virtual_text = { spacing = 2, prefix = "" }, -- Configure virtual text
        severity_soft = true, -- Enable soft severity
        float = {
          border = "rounded", -- Use rounded borders
        },
      })

      local capabilities = require('blink.cmp').get_lsp_capabilities()
      local lspconfig = require('lspconfig')

      lspconfig['lua_ls'].setup({ capabilities = capabilities }) -- Configure Lua LSP

      vim.keymap.set("n", "<leader>k", vim.lsp.buf.hover) -- Set keymap to show hover information
    end
  }

}
