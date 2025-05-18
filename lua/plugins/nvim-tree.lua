return {
  -- 插件：文件树
  "nvim-tree/nvim-tree.lua",
  version = "*",
  dependencies = {
    -- 依赖：文件图标
    "nvim-tree/nvim-web-devicons",
  },
  keys = {
    { "<leader>e", "<CMD>NvimTreeToggle<CR>", mode = { "n" }, desc = "[NvimTree] Toggle NvimTree" },
  },
  opts = {},
  init = function()
    -- 禁用 netrw 插件
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1

    -- 可选：启用 24 位颜色支持
    vim.opt.termguicolors = true
  end,
}
