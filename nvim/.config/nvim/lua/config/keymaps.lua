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

--窗口操作

map("n", "<C-w>s", "<C-w>s", { desc = "垂直创建窗口" })
map("n", "<C-w>v", "<C-w>v", { desc = "水平创建窗口" })
map("n", "<C-h>", "<C-w>h", { desc = "移动到左边窗口" })
map("n", "<C-l>", "<C-w>l", { desc = "移动到右边窗口" })
map("n", "<C-k>", "<C-w>k", { desc = "移动到上边窗口" })
map("n", "<C-j>", "<C-w>j", { desc = "移动到下边窗口" })
map("n", "<C-w>o", "<C-w>o", { desc = "关闭所有其他窗口" })
map("n", "<C-w>q", "<C-w>q", { desc = "关闭当前窗口" })

map("n", "sh", ":vertical resize -20<CR>")
map("n", "sl", ":vertical resize +20<CR>")

map("n", "sj", ":resize +10<CR>")
map("n", "sk", ":resize -10<CR>")

-- 切换/关闭buffer
if Util.has("bufferline.nvim") then
	map("n", "<S-h>", "<cmd>BufferLineCyclePrev<cr>", { desc = "切换到左边buffer" })
	map("n", "<S-l>", "<cmd>BufferLineCycleNext<cr>", { desc = "切换到右边buffer" })
else
	map("n", "<S-h>", "<cmd>bprevious<cr>", { desc = "切换到左边buffer" })
	map("n", "<S-l>", "<cmd>bnext<cr>", { desc = "切换到右边buffer" })
end
map("n", "<leader>bq", ":bdelete %<CR>", { desc = "关闭当前buffer" })
map("n", "<leader>bl", ":BufferLineCloseRight<CR>", { desc = "关闭左边所有buffer" })
map("n", "<leader>bh", ":BufferLineCloseLeft<CR>", { desc = "关闭右边所有buffer" })
map("n", "<leader>bc", ":BufferLinePickClose<CR>", { desc = "选择一个buffer关闭" })

-- 快速移动
map("n", "<S-j>", "8j", { desc = "向下移动8行" })
map("n", "<S-k>", "8k", { desc = "向上移动8行" })
map("n", "<S-b>", "0", { desc = "移动到行首" })
map("n", "<S-e>", "$", { desc = "移动到行尾" })
