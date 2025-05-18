return {

  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "lua-language-server", -- 安装 Lua 语言服务器
      },
    },
    config = function(_, opts)
      require("mason").setup(opts)
      local mr = require("mason-registry")
      local function ensure_installed()
        for _, tool in ipairs(opts.ensure_installed) do
          local p = mr.get_package(tool)
          if not p:is_installed() then
            p:install() -- 如果工具未安装，则安装
          end
        end
      end
      if mr.refresh then
        mr.refresh(ensure_installed) -- 刷新注册表后确保工具已安装
      else
        ensure_installed() -- 直接确保工具已安装
      end
    end,
  },

  {
    'neovim/nvim-lspconfig',
    dependencies = { 'saghen/blink.cmp' }, -- 添加依赖项

    -- 示例：直接为每个 LSP 调用 setup
    config = function()
      vim.diagnostic.config({
        underline = false, -- 禁用下划线
        signs = false, -- 禁用符号
        update_in_insert = false, -- 插入模式中不更新诊断
        virtual_text = { spacing = 2, prefix = "" }, -- 配置虚拟文本
        severity_soft = true, -- 启用软性严重性
        float = {
          border = "rounded", -- 使用圆角边框
        },
      })

      local capabilities = require('blink.cmp').get_lsp_capabilities()
      local lspconfig = require('lspconfig')

      lspconfig['lua_ls'].setup({ capabilities = capabilities }) -- 配置 Lua LSP

      vim.keymap.set("n", "<leader>k", vim.lsp.buf.hover) -- 设置快捷键以显示悬停信息
    end
  }

}
