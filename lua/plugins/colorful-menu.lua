return {
    "xzbdmw/colorful-menu.nvim",
    config = function()
        -- 您不需要设置这些选项。
        require("colorful-menu").setup({
            ls = {
                lua_ls = {
                    -- 也许您想稍微调暗参数。
                    arguments_hl = "@comment",
                },
                gopls = {
                    -- 默认情况下，我们在最右侧渲染变量/函数的类型，
                    -- 以避免它们与原始标签挤在一起。

                    -- 当为 true 时：
                    -- foo             *Foo
                    -- ast         "go/ast"

                    -- 当为 false 时：
                    -- foo *Foo
                    -- ast "go/ast"
                    align_type_to_right = true,
                    -- 当为 true 时，字段和变量的标签将格式化为 "foo: Foo"
                    -- 而不是 go 的原始语法 "foo Foo"。如果 align_type_to_right 为
                    -- true，则此选项无效。
                    add_colon_before_type = false,
                    -- 参见 https://github.com/xzbdmw/colorful-menu.nvim/pull/36
                    preserve_type_when_truncate = true,
                },
                -- 对于 lsp_config 或 typescript-tools
                ts_ls = {
                    -- false 表示不包括任何额外信息，
                    -- 参见 https://github.com/xzbdmw/colorful-menu.nvim/issues/42
                    extra_info_hl = "@comment",
                },
                vtsls = {
                    -- false 表示不包括任何额外信息，
                    -- 参见 https://github.com/xzbdmw/colorful-menu.nvim/issues/42
                    extra_info_hl = "@comment",
                },
                ["rust-analyzer"] = {
                    -- 例如 (as Iterator), (use std::io)。
                    extra_info_hl = "@comment",
                    -- 类似于 gopls 的相同设置。
                    align_type_to_right = true,
                    -- 参见 https://github.com/xzbdmw/colorful-menu.nvim/pull/36
                    preserve_type_when_truncate = true,
                },
                clangd = {
                    -- 例如 "From <stdio.h>"。
                    extra_info_hl = "@comment",
                    -- 类似于 gopls 的相同设置。
                    align_type_to_right = true,
                    -- "•std::filesystem::permissions(..)" 的前导点的高亮组
                    import_dot_hl = "@comment",
                    -- 参见 https://github.com/xzbdmw/colorful-menu.nvim/pull/36
                    preserve_type_when_truncate = true,
                },
                zls = {
                    -- 类似于 gopls 的相同设置。
                    align_type_to_right = true,
                },
                roslyn = {
                    extra_info_hl = "@comment",
                },
                dartls = {
                    extra_info_hl = "@comment",
                },
                -- 同样适用于 pyright/pylance
                basedpyright = {
                    -- 通常是导入路径，例如 "os"
                    extra_info_hl = "@comment",
                },
                pylsp = {
                    extra_info_hl = "@comment",
                    -- 调暗函数参数区域，这是与 pyright 的主要区别。
                    arguments_hl = "@comment",
                },
                -- 如果为 true，尝试高亮“不支持”的语言。
                fallback = true,
                -- 这将应用于不支持语言的标签描述
                fallback_extra_info_hl = "@comment",
            },
            -- 如果内置逻辑未能为标签找到合适的高亮组，
            -- 此高亮将应用于标签。
            fallback_highlight = "@variable",
            -- 如果提供，插件会将最终显示的文本截断为
            -- 此宽度（以显示单元为单位）。任何超出截断点的高亮将被忽略。
            -- 当设置为 0 到 1 之间的浮点数时，它将被视为窗口宽度的百分比：
            -- math.floor(max_width * vim.api.nvim_win_get_width(0))
            -- 默认值为 60。
            max_width = 60,
        })
    end,
}
