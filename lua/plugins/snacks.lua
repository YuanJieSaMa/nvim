return
{
  "folke/snacks.nvim",
    dependencies = {  "folke/edgy.nvim",
  ---@module 'edgy'
  ---@param opts Edgy.Config
  opts = function(_, opts)
    for _, pos in ipairs({ "top", "bottom", "left", "right" }) do
      opts[pos] = opts[pos] or {}
      table.insert(opts[pos], {
        ft = "snacks_terminal",
        size = { height = 0.4 },
        title = "%{b:snacks_terminal.id}: %{b:term_title}",
        filter = function(_buf, win)
          return vim.w[win].snacks_win
            and vim.w[win].snacks_win.position == pos
            and vim.w[win].snacks_win.relative == "editor"
            and not vim.w[win].trouble_preview
        end,
      })
    end
  end,},
  priority = 1000,
  lazy = false,
  init = function ()
    vim.g.snacks_animate = false
  end,
  ---@type snacks.Config
  opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
    lazygit = {enabled = true},
    bigfile = { enabled = true },
    dashboard = { enabled = true },
    terminal = { enabled = true ,  win = { style = "terminal" },},
    explorer = { enabled = false },
    indent = { enabled = true},
    input = { enabled = true },
    picker = { enabled = true,layout = { preset = "vertical" },
        zen = {enabled = true},
        win = {
        -- input window
        input = {
          keys = {
            -- to close the picker on ESC instead of going to normal mode,
            -- add the following keymap to your config
            -- ["<Esc>"] = { "close", mode = { "n", "i" } },
            ["<c-a>"] = { "select_all", mode = { "n", "i" } },
            ["<S-k>"] = { "list_scroll_down", mode = { "i", "n" } },
            ["<S-i>"] = { "list_scroll_up", mode = { "i", "n" } },
            ["<c-j>"] = { "list_down", mode = { "i", "n" } },
            ["<c-k>"] = { "list_up", mode = { "i", "n" } },
            ["k"] = "list_down",
            ["i"] = "list_up",
          },
          b = {
            minipairs_disable = true,
          },
        },
        -- result list window
        list = {
          keys = {
            ["/"] = "toggle_focus",
            ["<2-LeftMouse>"] = "confirm",
            ["<CR>"] = "confirm",
            ["<Down>"] = "list_down",
            ["<Esc>"] = "cancel",
            ["<S-CR>"] = { { "pick_win", "jump" } },
            ["<S-Tab>"] = { "select_and_prev", mode = { "n", "x" } },
            ["<Tab>"] = { "select_and_next", mode = { "n", "x" } },
            ["<Up>"] = "list_up",
            ["<a-d>"] = "inspect",
            ["<a-f>"] = "toggle_follow",
            ["<a-h>"] = "toggle_hidden",
            ["<a-i>"] = "toggle_ignored",
            ["<a-m>"] = "toggle_maximize",
            ["<a-p>"] = "toggle_preview",
            ["<a-w>"] = "cycle_win",
            ["<c-a>"] = "select_all",
            ["<c-b>"] = "preview_scroll_up",
            ["<c-f>"] = "preview_scroll_down",
            ["<c-j>"] = "list_down",
            ["<c-k>"] = "list_up",
            ["<c-n>"] = "list_down",
            ["<c-p>"] = "list_up",
            ["<c-q>"] = "qflist",
            ["<c-s>"] = "edit_split",
            ["<c-t>"] = "tab",
            ["<S-k>"] = { "list_scroll_down", mode = { "i", "n" } },
            ["<S-i>"] = { "list_scroll_up", mode = { "i", "n" } },
            ["<c-v>"] = "edit_vsplit",
            ["<c-w>H"] = "layout_left",
            ["<c-w>J"] = "layout_bottom",
            ["<c-w>K"] = "layout_top",
            ["<c-w>L"] = "layout_right",
            ["?"] = "toggle_help_list",
            ["G"] = "list_bottom",
            ["gg"] = "list_top",
            ["n"] = "focus_input",
            ["k"] = "list_down",
            ["i"] = "list_up",
            ["q"] = "close",
            ["zb"] = "list_scroll_bottom",
            ["zt"] = "list_scroll_top",
            ["zz"] = "list_scroll_center",
          },
          wo = {
            conceallevel = 2,
            concealcursor = "nvc",
          },
        },
        -- preview window
        preview = {
          keys = {
            ["<Esc>"] = "cancel",
            ["q"] = "close",
            ["i"] = "focus_input",
            ["<ScrollWheelDown>"] = "list_scroll_wheel_down",
            ["<ScrollWheelUp>"] = "list_scroll_wheel_up",
            ["<a-w>"] = "cycle_win",
          },
        },
      },





      },
    notifier = { enabled = true, style = "notification"},
    quickfile = { enabled = true },
    scope = { enabled = true,
      },
    scroll = { enabled = true },
    statuscolumn = { enabled = true },
    words = { enabled = true },
  },
    keys = {
      -- Git
      {
        "<leader>gb",
        function()
          require("snacks").gitbrowse()
        end,
        desc = "[Snacks] Git browse",
      },
      {
        "<leader>gg",
        function()
          require("snacks").lazygit()
        end,
        desc = "[Snacks] Lazygit Toggle",
      },

      -- Notifications
      {
        "<leader>n",
        function()
          require("snacks").picker.notifications()
        end,
        desc = "[Snacks] Notification History",
      },

      -- Picker
      {
        "<leader>ss",
        function()
          Snacks.picker.smart()
        end,
        desc = "Smart Find Files",
      },
      {
        "<leader>sl",
        function()
          Snacks.picker.lines()
        end,
        desc = "Buffer Lines",
      },
      {
        "<leader>sg",
        function()
          Snacks.picker.grep()
        end,
        desc = "Grep",
      },
      {
        "<leader>gd",
        function()
          Snacks.picker.lsp_definitions()
        end,
        desc = "Goto Definition",
      },
      {
        "<leader>gD",
        function()
          Snacks.picker.lsp_declarations()
        end,
        desc = "Goto Declaration",
      },
      {
        "<leader>gr",
        function()
          Snacks.picker.lsp_references()
        end,
        nowait = true,
        desc = "References",
      },
      {
        "<leader>tt",
        function()
          Snacks.terminal.toggle()
        end,
        desc = "Ternimal",
      },
      {
        "<leader>zz",
        function()
          Snacks.zen()
        end,
        desc = "Zen",
      },
    }
}
