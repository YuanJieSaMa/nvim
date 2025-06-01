return {
    "jake-stewart/multicursor.nvim",
    branch = "1.0",
    opts = {},

    config = function()
        local mc = require("multicursor-nvim")
        mc.setup()

        local set = vim.keymap.set

        -- Add cursors to all matches of the search
        set("n", "<leader>/A", mc.searchAllAddCursors, { desc = "Add cursors to all matches of the search" })
        set({ "n", "x" }, "<leader>A", mc.matchAllAddCursors, { desc = "Add cursors to all matches of the search in normal and visual modes" })

        -- Add or skip adding a new cursor by matching word/selection
        set({ "n", "x" }, "<leader>n", function() mc.matchAddCursor(1) end, { desc = "Add a new cursor by matching word/selection forward" })
        set({ "n", "x" }, "<leader>b", function() mc.matchSkipCursor(1) end, { desc = "Skip adding a new cursor by matching word/selection forward" })
        set({ "n", "x" }, "<leader>N", function() mc.matchAddCursor(-1) end, { desc = "Add a new cursor by matching word/selection backward" })
        set({ "n", "x" }, "<leader>B", function() mc.matchSkipCursor(-1) end, { desc = "Skip adding a new cursor by matching word/selection backward" })

        -- Disable and enable cursors
        set({ "n", "x" }, "<leader><leader>a", mc.toggleCursor, { desc = "Toggle cursors on and off" })
        set({ "x" }, "<leader>N", mc.insertVisual)
        set({ "x" }, "<leader>A", mc.appendVisual)

        -- Add a keymap layer for cursor-specific actions
        mc.addKeymapLayer(function(layerSet)
            -- Select a different cursor as the main one
            layerSet({ "n", "x" }, "<left>", mc.prevCursor)
            layerSet({ "n", "x" }, "<right>", mc.nextCursor)

            -- Delete the main cursor
            layerSet({ "n", "x" }, "<leader>x", mc.deleteCursor)

            -- Enable and clear cursors using escape
            layerSet("n", "<esc>", function()
                if not mc.cursorsEnabled() then
                    mc.enableCursors()
                else
                    mc.clearCursors()
                end
            end)
        end)

        -- Customize how cursors look
        local hl = vim.api.nvim_set_hl
        hl(0, "MultiCursorCursor", { reverse = true }) -- Highlight for active cursors
        hl(0, "MultiCursorVisual", { link = "Visual" }) -- Highlight for visual mode
        hl(0, "MultiCursorSign", { link = "SignColumn" }) -- Highlight for sign column
        hl(0, "MultiCursorMatchPreview", { link = "Search" }) -- Highlight for match preview
        hl(0, "MultiCursorDisabledCursor", { reverse = true }) -- Highlight for disabled cursors
        hl(0, "MultiCursorDisabledVisual", { link = "Visual" }) -- Highlight for disabled visual mode
        hl(0, "MultiCursorDisabledSign", { link = "SignColumn" }) -- Highlight for disabled sign column
    end,
}
