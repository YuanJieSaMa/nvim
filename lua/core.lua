vim.g.mapleader = " "
local opts = {
  noremap = true, -- non-recursive
  silent = true,  -- do not show message
}
local keymap = vim.keymap
local nv = { "n", "v" }

------ 插入模式 ------

------ 视觉模式 ------
--单行或多行移动
keymap.set("v", "<C-s>", ":m '>+1<CR>gv=gv", opts)
keymap.set("v", "<C-w>", ":m '<-2<CR>gv=gv", opts)

------ 正常模式 ------
--新增窗口
keymap.set("n", "zl", "<C-w>v", opts) --水平新增
keymap.set("n", "zi", "<C-w>s", opts) --垂直新增

--移动键
vim.keymap.set(nv, "k", [[v:count ? 'j' : 'gj']], { noremap = true, expr = true })
vim.keymap.set(nv, "i", [[v:count ? 'k' : 'gk']], { noremap = true, expr = true })
keymap.set(nv, "j", "h", opts)
keymap.set(nv, "n", "i", opts)
keymap.set(nv, "N", "I", opts)
keymap.set(nv, "I", "5k", opts)
keymap.set(nv, "K", "5j", opts)
keymap.set(nv, "J", "5h", opts)
keymap.set(nv, "L", "5l", opts)

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

--取消高亮
keymap.set("n", "=", "n", opts)
keymap.set("n", "+", "N", opts)
keymap.set("n", "<leader><CR>", ":nohl<CR>", opts)


-----   OPTION   -----

local opt = vim.opt

-- 行号
opt.relativenumber = true
opt.number = true

-- 缩进
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.autoindent = true

-- 防止包裹
opt.wrap = false

-- 光标行
opt.cursorline = true

-- 启动鼠标
opt.mouse:append("a")

-- 系统剪贴板
opt.clipboard:append("unnamedplus")

-- 默认新窗口右和下
opt.splitright = true
opt.splitbelow = true

-- 搜索
opt.ignorecase = true
opt.smartcase = true



----- Plugins -----
--tree
keymap.set('n', 'tr', ':NvimTreeToggle<CR>', opts)
keymap.set('n', 'tc', ':NvimTreeCollapse<CR>', opts)
--bufferline
keymap.set("n", "<leader>1", ":BufferLineGoToBuffer 1<CR>", { noremap = true, silent = true })
keymap.set("n", "<leader>2", ":BufferLineGoToBuffer 2<CR>", { noremap = true, silent = true })
keymap.set("n", "<leader>3", ":BufferLineGoToBuffer 3<CR>", { noremap = true, silent = true })
keymap.set("n", "<leader>4", ":BufferLineGoToBuffer 4<CR>", { noremap = true, silent = true })
keymap.set("n", "<leader>5", ":BufferLineGoToBuffer 5<CR>", { noremap = true, silent = true })
keymap.set("n", "<leader>6", ":BufferLineGoToBuffer 6<CR>", { noremap = true, silent = true })
keymap.set("n", "<leader>7", ":BufferLineGoToBuffer 7<CR>", { noremap = true, silent = true })
keymap.set("n", "<leader>8", ":BufferLineGoToBuffer 8<CR>", { noremap = true, silent = true })
keymap.set("n", "<leader>9", ":BufferLineGoToBuffer 9<CR>", { noremap = true, silent = true })
keymap.set("n", "<leader>ca", ":BufferLineCloseLeft<CR>:BufferLineCloseRight<CR>", { noremap = true, silent = true })
keymap.set("n", "<leader>cc", ":BufferLinePickClose<CR>", { noremap = true, silent = true })
--Telescopw--
keymap.set("n", "<leader>f", ":Telescope find_files<CR>", opts)
keymap.set("n", "<leader>h", ":Telescope help_tags<CR>", opts)
keymap.set("n", "<leader>o", ":Telescope oldfiles<CR>", opts)
--LSPconfig--
vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
vim.keymap.set('n', '<leader>s', function()
  vim.lsp.buf.format { async = true }
end, opts)
