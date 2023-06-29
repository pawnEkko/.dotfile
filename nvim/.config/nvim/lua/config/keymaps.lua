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
local Util = require("util")
map({ "n", "x" }, "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
map({ "n", "x" }, "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
map({ "i", "v", "n", "s" }, "<C-s>", "<cmd>w<cr><esc>")
map("n", "<leader>l", "<cmd>Lazy<cr>", { desc = "Lazy" })
-----------------------插入模式---------------------------
-- 返回普通模式
map("i", "ii", "<Esc>")

-----------------------视图模式---------------------------
-- 单行或多行移动
map("v", "<A-j>", ":m '>+1<CR>gv=gv")
map("v", "<A-k>", ":m '<-2<CR>gv=gv")

-----------------------普通模式---------------------------
map("n", "<leader>mh", ":nohl<CR>", { desc = "取消高亮" })

-- 单行移动
map("n", "<A-k>", ":m .-2<CR>==") -- 向上移动
map("n", "<A-j>", ":m .+1<CR>==") -- 向下移动

-- 切换窗口
map("n", "<C-h>", "<C-w>h") -- 移动到左边窗口
map("n", "<C-l>", "<C-w>l") -- 移动到右边窗口
map("n", "<C-k>", "<C-w>k") -- 移动到上边窗口
map("n", "<C-j>", "<C-w>j") -- 移动到下边窗口

-- 切换/关闭buffer
if Util.has("bufferline.nvim") then
	map("n", "<S-h>", "<cmd>BufferLineCyclePrev<cr>", { desc = "Prev buffer" })
	map("n", "<S-l>", "<cmd>BufferLineCycleNext<cr>", { desc = "Next buffer" })
	map("n", "[b", "<cmd>BufferLineCyclePrev<cr>", { desc = "Prev buffer" })
	map("n", "]b", "<cmd>BufferLineCycleNext<cr>", { desc = "Next buffer" })
else
	map("n", "<S-h>", "<cmd>bprevious<cr>", { desc = "Prev buffer" })
	map("n", "<S-l>", "<cmd>bnext<cr>", { desc = "Next buffer" })
	map("n", "[b", "<cmd>bprevious<cr>", { desc = "Prev buffer" })
	map("n", "]b", "<cmd>bnext<cr>", { desc = "Next buffer" })
end
map("n", "<leader>bc", ":BufferLinePickClose<CR>", { desc = "选择关闭buffer" })
map("n", "<leader>bd", ":bdelete %<CR>", { desc = "关闭当前buffer" })

-- 快速移动
map("n", "<S-j>", "8j")
map("n", "<S-k>", "8k")
