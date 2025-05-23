return
{
    'romgrk/barbar.nvim',
    dependencies = {
        -- Optional: for git status
        'lewis6991/gitsigns.nvim',
        -- Optional: for file icons
        'nvim-tree/nvim-web-devicons',
    },
    init = function()
        -- Disable auto setup to allow manual configuration
        vim.g.barbar_auto_setup = false
    end,
    keys = {
        -- Key mappings for buffer navigation and management
        { "<A-o>", "<CMD>BufferMovePrevious<CR>", mode = { "n" }, desc = "[Buffer] Move buffer left" },
        { "<A-p>", "<CMD>BufferMoveNext<CR>", mode = { "n" }, desc = "[Buffer] Move buffer right" },
        { "<A-1>", "<CMD>BufferGoto 1<CR>", mode = { "n" }, desc = "[Buffer] Go to buffer 1" },
        { "<A-2>", "<CMD>BufferGoto 2<CR>", mode = { "n" }, desc = "[Buffer] Go to buffer 2" },
        { "<A-3>", "<CMD>BufferGoto 3<CR>", mode = { "n" }, desc = "[Buffer] Go to buffer 3" },
        { "<A-4>", "<CMD>BufferGoto 4<CR>", mode = { "n" }, desc = "[Buffer] Go to buffer 4" },
        { "<A-5>", "<CMD>BufferGoto 5<CR>", mode = { "n" }, desc = "[Buffer] Go to buffer 5" },
        { "<A-6>", "<CMD>BufferGoto 6<CR>", mode = { "n" }, desc = "[Buffer] Go to buffer 6" },
        { "<A-7>", "<CMD>BufferGoto 7<CR>", mode = { "n" }, desc = "[Buffer] Go to buffer 7" },
        { "<A-8>", "<CMD>BufferGoto 8<CR>", mode = { "n" }, desc = "[Buffer] Go to buffer 8" },
        { "<A-9>", "<CMD>BufferGoto 9<CR>", mode = { "n" }, desc = "[Buffer] Go to buffer 9" },
        { "<A-j>", "<CMD>BufferPrevious<CR>", mode = { "n" }, desc = "[Buffer] Previous buffer" },
        { "<A-l>", "<CMD>BufferNext<CR>", mode = { "n" }, desc = "[Buffer] Next buffer" },
        { "<A-q>", "<CMD>BufferClose<CR>", mode = { "n" }, desc = "[Buffer] Close buffer" },
    },
    event = { "VeryLazy" },
    opts = {
        -- lazy.nvim will automatically call setup for you. Place your options here.
        -- Any missing options will use default values:
        -- animation = true,
        -- insert_at_start = true,
        -- …etc.

        -- Set the file types for which barbar will offset
        sidebar_filetypes = {
            -- Use default values: {event = 'BufWinLeave', text = '', align = 'left'}
            NvimTree = true,
        },
    },
    -- Optional: update only when a new 1.x version is released
    version = '^1.0.0',
}
