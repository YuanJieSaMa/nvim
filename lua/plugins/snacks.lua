return
{
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  ---@type snacks.Config
  opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
    lazygit = {enabled = true},
    bigfile = { enabled = true },
    dashboard = { enabled = true },
    explorer = { enabled = false },
    indent = { enabled = true },
    input = { enabled = true },
    picker = { enabled = true },
    notifier = { enabled = true, style = "notification"},
    quickfile = { enabled = true },
    scope = { enabled = true },
    scroll = { enabled = true },
    statuscolumn = { enabled = true },
    words = { enabled = true },
  },
    keys = {
      -- Git
      {"<leader>gb", function ()
        require("snacks").gitbrowse()
      end, desc = "[Snacks] Git browse"},

      {"<leader>gg", function ()
        require("snacks").lazygit()
      end, desc = "[Snacks] Lazygit Toggle"},


      {"<leader>n", function ()
        require("snacks").picker.notifications()
      end, desc = "[Snacks] Notification History"},

    },
}
