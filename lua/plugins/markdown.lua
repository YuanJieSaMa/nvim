return
{
  "godlygeek/tabular",
  "preservim/vim-markdown",
  config = function()
    require("vim-markdown").setup {
      vim.cmd([[  let g:vim_markdown_math = 1
      ]])
    }
  end,
  "mzlogin/vim-markdown-toc",
}
