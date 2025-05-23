local opts = {
  noremap = true, -- non-recursive
  silent = true,  -- do not show message
}
local keymap = vim.keymap
local nv = { "n", "v" }

------ 插入模式 ------
---<tab>和<C-i>的ASCII码一致，使得这两个键位只能使用一个功能，扫码了...
keymap.set("i", "<C-j>", "<Left>",opts)
keymap.set("i", "<C-l>", "<Right>",opts)
keymap.set("i", "jk", "<Esc>",opts)

------ 视觉模式 ------
--单行或多行移动
keymap.set("x", "<C-k>", ":m '>+1<CR>gv=gv", opts)
keymap.set("x", "<C-i>", ":m '<-2<CR>gv=gv", opts)
keymap.set("n", "<C-a>", "<C-v>", opts)

------ 正常模式 ------
--新增窗口
keymap.set("n", "zl", "<C-w>v", opts) --水平新增
keymap.set("n", "zi", "<C-w>s", opts) --垂直新增

--窗口移动
keymap.set("n","<C-j>", "<C-w>h", opts)
keymap.set("n","<C-l>", "<C-w>l", opts)
keymap.set("n","<C-k>", "<C-w>j", opts)
keymap.set("n","<C-i>", "<C-w>k", opts)
--移动键
keymap.set(nv, "k", [[v:count ? 'j' : 'gj']], { noremap = true, expr = true })
keymap.set(nv, "i", [[v:count ? 'k' : 'gk']], { noremap = true, expr = true })
keymap.set(nv, "j", "h", opts)
keymap.set(nv, "n", "i", opts)
keymap.set(nv, "N", "I", opts)
keymap.set(nv, "I", "5k", opts)
keymap.set(nv, "K", "5j", opts)
keymap.set(nv, "J", "^", opts)
keymap.set(nv, "L", "$", opts)

--复制
keymap.set(nv, "yJ", "y^", opts)
keymap.set(nv, "yL", "y$", opts)

--保存 退出 刷新
keymap.set("n", "S", ":%s/\\r//g<CR>", opts)
keymap.set("n", "Q", ":q<CR>", opts)
keymap.set("n", "R", ":so<CR>", opts)

--搜索下一个 上一个 取消高光
keymap.set(nv,"=", "n",opts)
keymap.set(nv,"-", "N",opts)
keymap.set(nv,"<leader><CR>",":nohlsearch<CR>")
