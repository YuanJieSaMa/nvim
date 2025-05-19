return
{
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
  ---@type false | "classic" | "modern" | "helix"
  preset = "modern",
      win = {
        title = true,
        width = 0.4,
      },
  spec = {
    {"<leader>cc", group = "CodeCompanion", icon = "" },
    {"<leader>g", group = "Git", icon = "󰊢" },
    {"<leader>n", group = "Notification", icon = "󰍢" },
      },
  },
  keys = {
    {
      "<leader>?",
      function()
        require("which-key").show({ global = false })
      end,
      desc = "Buffer Local Keymaps (which-key)",
    },
  },
}
