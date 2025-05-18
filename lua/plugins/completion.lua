return {
  {
    'saghen/blink.cmp',
    -- 可选：为片段源提供片段支持
    -- 如果您想使用 friendly-snippets，请取消注释以下行
    -- dependencies = { 'rafamadriz/friendly-snippets' },

    -- 使用发布标签下载预构建的二进制文件
    version = '1.*',
    -- 或从源代码构建（需要 Rust 夜间版）：https://rust-lang.github.io/rustup/concepts/channels.html#working-with-nightly-rust
    -- 取消注释以下一行以从源代码构建：
    -- build = 'cargo build --release',
    -- build = 'nix run .#build-plugin',

    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    dependencies = {
      "giuxtaposition/blink-cmp-copilot",
    },
    opts = {
      -- 键映射配置
      -- 预设：
      -- 'default'（推荐）类似于内置补全的映射（C-y 接受）
      -- 'super-tab' 类似于 VSCode 的映射（Tab 接受）
      -- 'enter' 使用 Enter 接受
      -- 'none' 不使用映射
      --
      -- 所有预设包括以下映射：
      -- C-Space：打开菜单或如果已打开则打开文档
      -- C-n/C-p 或 上/下：选择下一个/上一个项目
      -- C-e：隐藏菜单
      -- C-k：切换签名帮助（如果 signature.enabled = true）
      --
      -- 查看 :h blink-cmp-config-keymap 以定义您自己的键映射
      keymap = {
        preset = 'none',
        ['<tab>'] = { 'select_next', 'snippet_backward', 'fallback' },
        ['<s-tab>'] = { 'select_prev', 'snippet_forward', 'fallback' },
        ['<Cr>'] = { 'accept', 'fallback' },
      },
      appearance = {
        -- 'mono'（默认）适用于 'Nerd Font Mono' 或 'normal' 适用于 'Nerd Font'
        -- 调整间距以确保图标对齐
        nerd_font_variant = 'mono',
      },

      -- 命令行特定配置
      cmdline = {
        keymap = {
          ['<Tab>'] = { 'show_and_insert', 'select_next' },
          ['<S-Tab>'] = { 'show_and_insert', 'select_prev' },
          ['<CR>'] = { 'accept_and_enter', 'fallback' },
        },

        sources = {
          min_keyword_length = function(ctx)
            -- 输入命令时，仅当关键字长度为 3 个字符或更长时显示建议
            if ctx.mode == 'cmdline' and string.find(ctx.line, ' ') == nil then
              return 3
            end
            return 0
          end,
        },
        -- 自动显示菜单
        completion = {
          menu = { auto_show = true },
          list = {
            selection = {
              preselect = false,
              auto_insert = true,
            },
          },
        },
      },

      -- 补全配置
      completion = {
        keyword = { range = 'full' },
        ghost_text = {
          enabled = true,
          show_without_selection = true,
        },
        menu = {
          auto_show = true,
          draw = {
            columns = {
              { "label", "label_description", gap = 1 },
              { "kind_icon", "kind" },
            },
            components = {
              label = {
                width = { fill = true, max = 60 },
                text = function(ctx)
                  local highlights_info = require("colorful-menu").blink_highlights(ctx)
                  if highlights_info ~= nil then
                    -- 如果需要，可以向标签添加更多项目
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
        documentation = { auto_show = true },
        list = {
          selection = {
            preselect = false,
            auto_insert = true,
          },
        },
      },

      -- 默认启用的提供者列表
      -- 由于 `opts_extend`，可以在配置的其他地方扩展，而无需重新定义
      sources = {
        default = { 'lsp', 'path', 'snippets', 'buffer', 'copilot' },
        providers = {
          copilot = {
            name = "copilot",
            module = "blink-cmp-copilot",
            score_offset = 100,
            async = true,
            opts = {
              kind_icon = "",
              kind_hl = "DevIconCopilot",
            },
          },
        },
      },

      -- 模糊匹配器配置
      -- 默认：Rust 模糊匹配器，具有拼写错误容忍性和显著更好的性能
      -- 您可以改用 Lua 实现，通过设置 `implementation = "lua"`
      -- 或在 Rust 模糊匹配器不可用时回退到 Lua 实现
      -- 通过设置 `implementation = "prefer_rust"`
      --
      -- 有关更多信息，请参阅模糊文档
      fuzzy = { implementation = "prefer_rust_with_warning" },
    },

    -- 使用默认源扩展选项
    opts_extend = { "sources.default" },
  },
}
