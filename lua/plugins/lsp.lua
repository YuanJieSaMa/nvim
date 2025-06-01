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
        ensure_installed()           -- Directly ensure tools are installed
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

      -- Keymap to show hover information
      vim.keymap.set("n", "<leader>k", vim.lsp.buf.hover, { desc = "Show hover information" })
      -- Go to definition
      vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', { desc = "Go to definition" })
      -- Go to declaration
      vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', { desc = "Go to declaration" })
      -- Go to implementation
      vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', { desc = "Go to implementation" })
      -- Go to type definition
      vim.keymap.set('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>', { desc = "Go to type definition" })
      -- List references
      vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', { desc = "List references" })
      -- Show signature help
      vim.keymap.set('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>', { desc = "Show signature help" })
      -- Rename symbol
      vim.keymap.set('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>', { desc = "Rename symbol" })
      -- Format code (works in normal and visual mode)
      vim.keymap.set({ 'n', 'x' }, '<F3>', '<cmd>lua vim.lsp.buf.format({async = true})<cr>', { desc = "Format code" })
      -- Show code actions
      vim.keymap.set('n', '<F4>', '<cmd>lua vim.lsp.buf.code_action()<cr>', { desc = "Show code actions" })


    end
  }

}
