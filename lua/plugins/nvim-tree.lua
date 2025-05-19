local function my_on_attach(bufnr)
  local api = require "nvim-tree.api"

  local function opts(desc)
    return { desc = "[Nvim-tree] " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end

  -- Default mappings
  api.config.mappings.default_on_attach(bufnr)

  -- Custom mappings
  vim.keymap.set('n', '?',     api.tree.toggle_help,                  opts('Help'))
  vim.keymap.set('n', 'j',     api.tree.change_root_to_parent,                  opts('Open the file'))
  vim.keymap.set('n', 'l',     api.node.open.edit,                  opts('Open the file'))
  vim.keymap.set('n', '<leader>tf',     api.tree.collapse_all,                  opts('Fold all directories'))
  vim.keymap.set('n', '<leader>te',     api.tree.expand_all,                  opts('Expand all directories'))
end

return {
  -- Plugin: File tree
  "nvim-tree/nvim-tree.lua",
  version = "*",
  dependencies = {
    -- Dependency: File icons
    "nvim-tree/nvim-web-devicons",
  },
  keys = {
    { "<leader>e", "<CMD>NvimTreeToggle<CR>", mode = { "n" }, desc = "[NvimTree] Toggle NvimTree" },
  },
  opts = {
    on_attach = my_on_attach,
  },
  init = function()
    -- Disable netrw plugin
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1

    -- Optional: Enable 24-bit color support
    vim.opt.termguicolors = true
  end,
}
