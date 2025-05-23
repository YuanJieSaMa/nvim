return {
  -- Plugin name: folke/noice.nvim
  -- This plugin enhances Neovim's notification and message system
  "folke/noice.nvim",
  event = "VeryLazy", -- Lazy loading event
  keys = {
  },
  opts = {
    -- Add any options here
    lsp = {
      -- Override markdown rendering to use **Treesitter** for **cmp** and other plugins
      override = {
        ["vim.lsp.util.convert_input_to_markdown_lines"] = true, -- Convert input to markdown lines
        ["vim.lsp.util.stylize_markdown"] = true, -- Stylize markdown
        ["cmp.entry.get_documentation"] = true, -- Requires hrsh7th/nvim-cmp
      },
    },
    -- Enable presets to simplify configuration
    presets = {
      bottom_search = true, -- Use classic bottom command line for search
      command_palette = true, -- Group command line and popup menu together
      long_message_to_split = true, -- Send long messages to a split
      inc_rename = false, -- Enable input dialog for inc-rename.nvim
      lsp_doc_border = false, -- Add border to hover docs and signature help
    },
  },
  dependencies = {
    -- If you lazy load any plugin below, make sure to add the proper `module="..."` entry
    "MunifTanjim/nui.nvim",
    -- Optional plugins:
    --   `nvim-notify` is only needed if you want to use the notification view.
    --   If not available, we will fall back to `mini`.
    -- "rcarriga/nvim-notify",
  },
}
