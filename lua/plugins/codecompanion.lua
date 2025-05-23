return {
  -- Specification for the CodeCompanion.nvim plugin
  "olimorris/codecompanion.nvim",
  version = "15.4.2",
  dependencies = {
    -- Required dependencies for CodeCompanion.nvim
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
    "j-hui/fidget.nvim",
  },
  init = function()
    -- Initialize the CodeCompanion plugin with a custom fidget spinner
    require("utils.codecompanion_fidget_spinner"):init()
  end,
  opts = {
    display = {
      diff = {
        enabled = true, -- Enable or disable the diff feature
        provider = "mini_diff", -- Diff provider
      },
    },
    strategies = {
      chat = { adapter = "copilot" }, -- Chat adapter
      inline = { adapter = "copilot" }, -- Inline adapter
    },
    opts = {
      language = "English", -- Language setting
    },
  },
  keys = {
    -- Key mapping to invoke specific actions of CodeCompanion
    {
      "<leader>cca",
      "<cmd>CodeCompanionAction<cr>",
      mode = { "n", "v" },
      noremap = true,
      silent = true,
      desc = "Run CodeCompanion Action",
    },
    -- Key mapping to toggle CodeCompanion chat
    {
      "<leader>ccc",
      "<cmd>CodeCompanionChat Toggle<cr>",
      mode = { "n", "v" },
      noremap = true,
      silent = true,
      desc = "Toggle CodeCompanion Chat",
    },
    -- Key mapping to add selected code to CodeCompanion
    {
      "<leader>ccp",
      "<cmd>CodeCompanion Add<cr>",
      mode = { "v" },
      noremap = true,
      silent = true,
      desc = "Add Code to CodeCompanion",
    },
    -- Key mapping to invoke CodeCompanion with support for visual mode
    {
      "<leader>cci",
      function()
        -- If in visual mode (v/V/^V), add '<,'>' range
        if vim.fn.mode() == "v" or vim.fn.mode() == "V" or vim.fn.mode() == "" then
          return ":<C-u>'<,'>CodeCompanion<CR>"
        else
          return ":CodeCompanion<CR>"
        end
      end,
      expr = true, -- Enable expression mode
      mode = { "n", "v" }, -- Support normal mode and visual mode
      noremap = true,
      silent = true,
      desc = "Invoke CodeCompanion",
    },
  },
}
