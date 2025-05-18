return {
  -- 插件名称: folke/noice.nvim
  -- 此插件用于增强 Neovim 的通知和消息系统
  "folke/noice.nvim",
  event = "VeryLazy", -- 延迟加载事件
  keys = {
    {
      "<leader>h",
      "<CMD>NoiceHistory<CR>",
      mode = { "n" },
      desc = "[Noice] Show Noice History" -- 快捷键描述
    },
  },
  opts = {
    -- 在此处添加任何选项
    lsp = {
      -- 重写 markdown 渲染，使 **cmp** 和其他插件使用 **Treesitter**
      override = {
        ["vim.lsp.util.convert_input_to_markdown_lines"] = true, -- 转换输入为 markdown 行
        ["vim.lsp.util.stylize_markdown"] = true, -- 样式化 markdown
        ["cmp.entry.get_documentation"] = true, -- 需要 hrsh7th/nvim-cmp
      },
    },
    -- 可以启用预设以简化配置
    presets = {
      bottom_search = true, -- 使用经典的底部命令行进行搜索
      command_palette = true, -- 将命令行和弹出菜单放在一起
      long_message_to_split = true, -- 长消息将发送到分屏
      inc_rename = false, -- 启用 inc-rename.nvim 的输入对话框
      lsp_doc_border = false, -- 为悬停文档和签名帮助添加边框
    },
  },
  dependencies = {
    -- 如果你延迟加载以下任何插件，请确保添加正确的 `module="..."` 条目
    "MunifTanjim/nui.nvim",
    -- 可选插件:
    --   `nvim-notify` 仅在你想使用通知视图时需要。
    --   如果不可用，我们将使用 `mini` 作为回退
    "rcarriga/nvim-notify",
  },
}
