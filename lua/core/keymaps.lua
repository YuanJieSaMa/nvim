vim.g.mapleader = " "
local opts = {
    noremap = true,      -- non-recursive
    silent = true,       -- do not show message
}
local keymap = vim.keymap
local nv = { "n", "v" }

------ 插入模式 ------

------ 视觉模式 ------
--单行或多行移动
keymap.set("v", "<C-X>", ":m '>+1<CR>gv=gv", opts)
keymap.set("v", "<C-S>", ":m '<-2<CR>gv=gv", opts)

------ 正常模式 ------
--新增窗口
keymap.set("n", "zs", "<C-w>v", opts) --水平新增
keymap.set("n", "zc", "<C-w>s", opts) --垂直新增

--移动键
keymap.set(nv, "k", "j", opts)
keymap.set(nv, "j", "h", opts)
keymap.set(nv, "i", "k", opts)
keymap.set("n", "n", "i", opts)
keymap.set("n", "N", "I", opts)
keymap.set(nv, "I", "5k", opts)
keymap.set(nv, "K", "5j", opts)

--保存 退出 刷新
keymap.set("n", "S", ":w<CR>", opts)
keymap.set("n", "Q", ":q<CR>", opts)
keymap.set("n", "R", ":so<CR>", opts)

--更改窗口大小
keymap.set('n', '<C-Down>', ':resize -2<CR>', opts)
keymap.set('n', '<C-Up>', ':resize +2<CR>', opts)
keymap.set('n', '<C-Right>', ':vertical resize -2<CR>', opts)
keymap.set('n', '<C-Left>', ':vertical resize +2<CR>', opts)

--光标跃迁
keymap.set('n', '<C-j>', '<C-w>h', opts)
keymap.set('n', '<C-k>', '<C-w>j', opts)
keymap.set('n', '<C-i>', '<C-w>k', opts)
keymap.set('n', '<C-l>', '<C-w>l', opts)

--寻找高亮 取消高亮
keymap.set("n", "-", "Nzz", opts)
keymap.set("n", "=", "nzz", opts)
keymap.set("n", "<leader><CR>", ":nohl<CR>", opts)

------ 插件 ------
-- nvim-tree
keymap.set("n", "tr", ":NvimTreeToggle<CR>")
keymap.set("n", "L", ":bnext<CR>")
keymap.set("n", "J", ":bprevious<CR>")

-- markdown-preview
keymap.set("n", "r", ":MarkdownPreview<CR>")

