local opt = vim.opt
-----   OPTION   -----

-- 行号
opt.number = true
opt.relativenumber = true

-- 缩进
opt.list = true
opt.listchars = { tab = ">-", trail = "-" }
--opt.softtabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.smartindent = true
-- 自动换行
--opt.wrap = true

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
