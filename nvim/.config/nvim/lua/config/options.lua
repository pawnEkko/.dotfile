-- leader 设置
vim.g.mapleader = " "
vim.g.maplocalleader = " "
-- 设置变量
local opt = vim.opt
--------------------------------------------个性化设置------------------------------
opt.backup = false
vim.cmd([[set iskeyword+=-]]) -- 辨认使用连接符号的单词
vim.cmd("nohlsearch") -- 关闭搜索之后打开新文件搜索字符高亮
opt.clipboard:append("unnamedplus") -- 启用系统剪贴板
opt.number = true -- 启用行号
opt.relativenumber = false -- 相对行号
opt.wrap = false -- 防止包裹
opt.cursorline = true -- 光标行
opt.mouse:append("a") -- 启用鼠标
opt.encoding = "utf-8" -- 默认编码格式
opt.autowrite = true -- 窗口失去焦点自动保存
opt.scrolloff = 10 -- 预留行数
-- opt.spell = true -- 启动语法检查
-- opt.spelllang = {"en_us"}             -- 语法检查语言设置

-- 外观(开启终端真颜色)
opt.termguicolors = true
opt.signcolumn = "yes"

-- 语法高亮
vim.cmd("syntax on")
vim.cmd("filetype plugin indent on")

-- 缩进
opt.tabstop = 2
opt.shiftwidth = 2
opt.softtabstop = 2
opt.expandtab = true
opt.autoindent = true
opt.cindent = true
opt.smartindent = true
opt.list = true

-- 支持关闭undo
vim.bo.undofile = true

-- 默认新窗口右和下
opt.splitright = true
opt.splitbelow = true

-- 搜索
opt.hlsearch = true
opt.incsearch = true
opt.ignorecase = true
opt.smartcase = true
opt.showmatch = true

-- 关闭新行缩进
vim.api.nvim_create_autocmd({ "BufEnter" }, {
	pattern = "*",
	callback = function()
		vim.opt.formatoptions = vim.opt.formatoptions - { "c", "r", "o" }
	end,
})


