return {
  {
    "preservim/vim-markdown",
    config = function()
      vim.cmd([[
        let g:vim_markdown_math = 1
        let g:vim_markdown_folding_disabled = 0
        let g:vim_markdown_new_list_item_indent = 0
        " let g:vim_markdown_preview_hotkey = '<F8>'
      ]])
    end
  },
  {
    "godlygeek/tabular"
  },
  {
    "mzlogin/vim-markdown-toc"
  },
  -- 其他插件配置...
  {
    "ellisonleao/glow.nvim",
    config = function()
      require("glow").setup({ vim.api.nvim_set_keymap('n', '<leader>md', ':Glow<CR>', { noremap = true, silent = true })
      })
      -- 设置快捷键为 <leader>md 来预览 Markdown 文件
    end
  },
}
