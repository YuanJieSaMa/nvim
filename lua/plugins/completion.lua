return {
  {
    'saghen/blink.cmp',
    -- Optional: Provide snippet support for the snippet source
    -- Uncomment the following line if you want to use friendly-snippets
    -- dependencies = { 'rafamadriz/friendly-snippets' },

    -- Use release tags to download prebuilt binaries
    version = '1.*',
    -- Or build from source (requires Rust nightly): https://rust-lang.github.io/rustup/concepts/channels.html#working-with-nightly-rust
    -- Uncomment the following line to build from source:
    -- build = 'cargo build --release',
    -- build = 'nix run .#build-plugin',

    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    dependencies = {
      "giuxtaposition/blink-cmp-copilot",
    },
    opts = {
      -- Keymap configuration
      -- Presets:
      -- 'default' (recommended) similar to built-in completion mappings (C-y to accept)
      -- 'super-tab' similar to VSCode mappings (Tab to accept)
      -- 'enter' uses Enter to accept
      -- 'none' disables mappings
      --
      -- All presets include the following mappings:
      -- C-Space: Open menu or open documentation if already open
      -- C-n/C-p or Up/Down: Select next/previous item
      -- C-e: Hide menu
      -- C-k: Toggle signature help (if signature.enabled = true)
      --
      -- See :h blink-cmp-config-keymap to define your own key mappings
      keymap = {
        preset = 'none',
        ['<tab>'] = { 'select_next', 'snippet_backward', 'fallback' },
        ['<s-tab>'] = { 'select_prev', 'snippet_forward', 'fallback' },
        ['<Cr>'] = { 'accept', 'fallback' },
      },
      appearance = {
        -- 'mono' (default) for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
        -- Adjust spacing to ensure icon alignment
        nerd_font_variant = 'mono',
        -- Blink does not expose its default kind icons so you must copy them all (or set your custom ones) and add Copilot
        kind_icons = {
          Copilot = "",
          Text = '󰉿',
          Method = '󰊕',
          Function = '󰊕',
          Constructor = '󰒓',

          Field = '󰜢',
          Variable = '󰆦',
          Property = '󰖷',

          Class = '󱡠',
          Interface = '󱡠',
          Struct = '󱡠',
          Module = '󰅩',

          Unit = '󰪚',
          Value = '󰦨',
          Enum = '󰦨',
          EnumMember = '󰦨',

          Keyword = '󰻾',
          Constant = '󰏿',

          Snippet = '󱄽',
          Color = '󰏘',
          File = '󰈔',
          Reference = '󰬲',
          Folder = '󰉋',
          Event = '󱐋',
          Operator = '󰪚',
          TypeParameter = '󰬛',
        },
      },

      -- Command-line specific configuration
      cmdline = {
        keymap = {
          ['<CR>'] = { 'accept_and_enter', 'fallback' },
          ['<Tab>'] = { 'show_and_insert', 'select_next' },
          ['<S-Tab>'] = { 'show_and_insert', 'select_prev' },
        },
        -- (optionally) automatically show the menu
        completion = {
          menu = {
            auto_show = true,
          },
          list = {
            selection = {
              preselect = false,
            },
          },
        },
      },
      completion = {
        keyword = { range = 'full' },
        ghost_text = {
          enabled = true,
          show_without_selection = true,
        },

        menu = {
          auto_show = true,
          border = 'rounded',
          winblend = 0,
          draw = {
            columns = {
              { "label",     "label_description", gap = 1 },
              { "kind_icon", "kind" },
            },
            components = {
              label = {
                width = { fill = true, max = 60 },
                text = function(ctx)
                  local highlights_info = require("colorful-menu").blink_highlights(ctx)
                  if highlights_info ~= nil then
                    -- Add more items to the label if needed
                    return highlights_info.label
                  else
                    return ctx.label
                  end
                end,
                highlight = function(ctx)
                  local highlights = {}
                  local highlights_info = require("colorful-menu").blink_highlights(ctx)
                  if highlights_info ~= nil then
                    highlights = highlights_info.highlights
                  end
                  for _, idx in ipairs(ctx.label_matched_indices) do
                    table.insert(highlights, { idx, idx + 1, group = "BlinkCmpLabelMatch" })
                  end
                  return highlights
                end,
              },
            },
          },
        },
        documentation = { auto_show = true, auto_show_delay_ms = 500 },
        list = {
          selection = {
            preselect = false,
            auto_insert = true,
          },
        },
      },

      -- List of providers enabled by default
      -- Can be extended elsewhere in the configuration without redefining due to `opts_extend`
      sources = {
        default = { 'lsp', 'path', 'snippets', 'buffer', 'copilot' },
        providers = {
          cmdline = {
            min_keyword_length = function(ctx)
              -- when typing a command, only show when the keyword is 3 characters or longer
              if ctx.mode == 'cmdline' and string.find(ctx.line, ' ') == nil then
                return 3
              end
              return 0
            end,
          },
          copilot = {
            transform_items = function(_, items)
              local CompletionItemKind = require("blink.cmp.types").CompletionItemKind
              local kind_idx = #CompletionItemKind + 1
              CompletionItemKind[kind_idx] = "Copilot"
              for _, item in ipairs(items) do
                item.kind = kind_idx
              end
              return items
            end,
            name = "copilot",
            module = "blink-cmp-copilot",
            score_offset = 100,
            async = true,
          },
        },
      },

      -- Fuzzy matcher configuration
      -- Default: Rust fuzzy matcher with typo tolerance and significantly better performance
      -- You can use the Lua implementation instead by setting `implementation = "lua"`
      -- Or fallback to Lua implementation when Rust fuzzy matcher is unavailable
      -- by setting `implementation = "prefer_rust"`
      --
      -- See fuzzy documentation for more details
      fuzzy = { implementation = "prefer_rust_with_warning" },
    },

    -- Extend options with default sources
    opts_extend = { "sources.default" },
  },
}
