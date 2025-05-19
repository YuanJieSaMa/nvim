return {
    "catppuccin/nvim", -- Plugin name
    name = "catppuccin", -- Plugin alias
    priority = 1000, -- Plugin load priority
    opts = {
        flavour = "frappe", -- Color scheme: latte, frappe, macchiato, mocha
        background = { -- Background settings :h background
            light = "latte", -- Light mode
            dark = "frappe", -- Dark mode
        },
        transparent_background = true, -- Disable background color settings

        custom_highlights = function(colors) -- Custom highlights
            return {
                Visual = { fg = colors.yellow, bg = colors.overlay1 }, -- Selected area
                LineNr = { fg = colors.rosewater, style = { "italic" } }, -- Line number
                CursorLineNr = { fg = colors.pink, style = { "bold" } }, -- Current line number
                CursorLine = { bg = colors.surface0 }, -- Current line background
                Search = { fg = colors.green }, -- Search results
                IncSearch = { fg = colors.green }, -- Incremental search
                CurSearch = { fg = colors.green }, -- Current search
                MatchParen = { fg = colors.red, bg = colors.surface0 }, -- Matching parentheses
            }
        end,
        integrations = {
            cmp = true,
            gitsigns = true,
            nvimtree = true,
            mason = true,
            treesitter = true,
            notify = true,
            noice = true,
            rainbow_delimiters = true,
            mini = {
                enabled = false,
                indentscope_color = "",
            },
            blink_cmp = true,
            fidget = true,
            snacks = {
                enabled = true,
                indent_scope_color = "", -- catppuccin color (eg. `lavender`) Default: text
            },
            which_key = true,
            -- For more plugin integrations, see (https://github.com/catppuccin/nvim#integrations)
        },
    },
    init = function() -- Initialization function
        vim.opt.background = "dark" -- Set background to dark
        vim.cmd.colorscheme "catppuccin" -- Apply catppuccin color scheme
    end,
}
