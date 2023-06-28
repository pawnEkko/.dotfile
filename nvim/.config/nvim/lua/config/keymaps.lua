local function map(mode, lhs, rhs, opts)
	local keys = require("lazy.core.handler").handlers.keys
	---@cast keys LazyKeysHandler
	-- do not create the keymap if a lazy keys handler exists
	if not keys.active[keys.parse({ lhs, mode = mode }).id] then
		opts = opts or {}
		opts.silent = opts.silent ~= false
		if opts.remap and not vim.g.vscode then
			opts.remap = nil
		end
		vim.keymap.set(mode, lhs, rhs, opts)
	end
end

map({ "i", "v", "n", "s" }, "<C-s>", "<cmd>w<cr><esc>")

-----------------------插入模式---------------------------
-- 返回普通模式
map("i", "ii", "<Esc>")

-----------------------视图模式---------------------------
-- 单行或多行移动
map("v", "<A-j>", ":m '>+1<CR>gv=gv")
map("v", "<A-k>", ":m '<-2<CR>gv=gv")

-----------------------普通模式---------------------------
map("n", "<leader>nh", ":nohl<CR>") -- 取消高亮

-- 单行移动
map("n", "<A-k>", ":m .-2<CR>==") -- 向上移动
map("n", "<A-j>", ":m .+1<CR>==") -- 向下移动

-- 切换窗口
map("n", "<C-h>", "<C-w>h") -- 移动到左边窗口
map("n", "<C-l>", "<C-w>l") -- 移动到右边窗口
map("n", "<C-k>", "<C-w>k") -- 移动到上边窗口
map("n", "<C-j>", "<C-w>j") -- 移动到下边窗口

-- 切换/关闭buffer
map("n", "<S-l>", ":bnext<CR>") -- 切换到右边的buffer
map("n", "<S-h>", ":bprevious<CR>") -- 切换到左边的buffer
map("n", "<leader>bq", ":bdelete%<CR>") -- 关闭当前buffer
map("n", "<leader>bc", ":BufferLinePickClose<CR>") -- 选择关闭buffer

-- 快速移动
map("n", "<S-j>", "8j")
map("n", "<S-k>", "8k")
