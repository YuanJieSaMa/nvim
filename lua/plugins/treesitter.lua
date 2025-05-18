return {

    {
        -- Treesitter plugin for better syntax highlighting and code manipulation
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate", -- Automatically update Treesitter parsers
        config = function()
            local configs = require("nvim-treesitter.configs")

            configs.setup({
                auto_install = true, -- 自动安装文件的语言解析器
                ensure_installed = {
                    "c", "lua", "vim", "vimdoc", "query",
                    "elixir", "heex", "javascript", "html"
                }, -- 要安装的语言列表
                sync_install = false, -- 禁用同步安装
                highlight = { enable = true }, -- 启用语法高亮
                indent = { enable = true }, -- 启用智能缩进
            })
        end
    }

}
