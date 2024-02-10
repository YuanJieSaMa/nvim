return {
  "nvim-treesitter/nvim-treesitter",
  config = function()
    require 'nvim-treesitter.configs'.setup({
      incremental_selection = {
        enable = true,
        keymaps = {
          node_incremental = "v",
          node_decremental = "<BS>",
        },
      },
      highlight = {
        enable = true,
      },
    })
  end
}
