return
  {
    'nvim-lualine/lualine.nvim',
    dependencies = {
       'nvim-tree/nvim-web-devicons', -- 图标支持
       'AndreM222/copilot-lualine' -- Copilot 状态集成
    },
    opts = {
      options = {
        theme = "catppuccin", -- 使用 Catppuccin 主题
        always_divide_middle = false, -- 不总是分割中间部分
        component_separators = { left = "", right = "" }, -- 组件分隔符
        section_separators = { left = "", right = "" }, -- 区域分隔符
      },
      sections = {
        lualine_a = { "mode" }, -- 显示当前模式
        lualine_b = { "branch", "diff", "diagnostics" }, -- 显示分支、差异和诊断信息
        lualine_c = { "filename" }, -- 显示文件名
        lualine_x = {}, -- 预留扩展
        lualine_y = { "encoding", "fileformat", "filetype", "progress" }, -- 显示编码、文件格式、文件类型和进度
        lualine_z = { "location" }, -- 显示光标位置
      },
      winbar = {
        lualine_a = {
          { function() return " " end, color = 'Comment'}, -- 空白占位符
        },
        lualine_b = {
          { function() return " " end, color = 'Comment'}, -- 空白占位符
        },
        lualine_x = {
          "lsp_status" -- 显示 LSP 状态
        }
      },
      inactive_winbar = {
        -- 始终显示 winbar
        lualine_b = { function() return " " end }, -- 空白占位符
      },
    },
    config = function(_, opts)
      local frappe = require("catppuccin.palettes").get_palette "frappe" -- 获取 Catppuccin Frappe 调色板

      -- 显示宏录制状态
      local function show_macro_recording()
        local recording_register = vim.fn.reg_recording()
        if recording_register == "" then
          return ""
        else
          return "󰑋 " .. recording_register -- 显示录制的寄存器
        end
      end

      local macro_recording = {
        show_macro_recording,
        color = { fg = "#333333", bg = frappe.red }, -- 设置颜色
        separator = { left = "", right = "" }, -- 设置分隔符
        padding = 0, -- 无填充
      }
      local copilot = {
        "copilot", -- Copilot 状态
        show_colors = true, -- 显示颜色
        symbols = {
          status = {
            hl = {
              enabled = frappe.green, -- 启用状态颜色
              sleep = frappe.overlay0, -- 休眠状态颜色
              disabled = frappe.surface0, -- 禁用状态颜色
              warning = frappe.peach, -- 警告状态颜色
              unknown = frappe.red, -- 未知状态颜色
            },
          },
          spinner_color = frappe.mauve, -- 加载动画颜色
        },
      }
      table.insert(opts.sections.lualine_x, 1, macro_recording) -- 插入宏录制状态到 lualine_x
      table.insert(opts.sections.lualine_c, copilot) -- 插入 Copilot 状态到 lualine_c

      require("lualine").setup(opts) -- 配置 lualine
    end
  }
