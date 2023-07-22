local M = {}
-- saga.init_lsp_saga()

M._keys = nil

---@return (LazyKeys|{has?:string})[]
function M.get()
	local format = function()
		require("plugins.lsp.format").format({ force = true })
	end
	if not M._keys then
  ---@class PluginLspKeys
    -- stylua: ignore
		M._keys = {
      { "<leader>cj", "<cmd>Lspsaga goto_definition<cr>", desc = "Goto Definition", has = "definition" },
      { "<leader>cJ", "<cmd>Lspsaga goto_type_definition<cr>", desc = "Goto T[y]pe Definition", has = "definition" },
			{ "<leader>cn", "<cmd>Lspsaga diagnostic_jump_prev<cr>", desc = "跳转到下一个提醒" },
      { "<leader>cz", "<cmd>Lspsaga show_workspace_diagnostics ++float<cr>", desc = "查看当前工作所有提醒" },
			{ "<leader>ck", "<cmd>Lspsaga hover_doc<cr>", mode = { "n", "v" }, desc = "查看信息" },
			{ "<leader>cf", format, desc = "格式化文件", has = "formatting" },
			{ "<leader>cf", format, desc = "区域格式化", mode = "v", has = "rangeFormatting" },
			{
				"<leader>cr",
				"<cmd>Lspsaga rename ++project<cr>",
				desc = "重命名",
				mode = { "n", "v" },
				has = "rename",
			},
			{
				"<leader>ca",
				"<cmd>Lspsaga code_action<cr>",
				desc = "Code Action",
				mode = { "n", "v" },
				has = "codeAction",
			},
		}
	end
	return M._keys
end

---@param method string
function M.has(buffer, method)
	method = method:find("/") and method or "textDocument/" .. method
	local clients = vim.lsp.get_active_clients({ bufnr = buffer })
	for _, client in ipairs(clients) do
		if client.supports_method(method) then
			return true
		end
	end
	return false
end

function M.resolve(buffer)
	local Keys = require("lazy.core.handler.keys")
	local keymaps = {} ---@type table<string,LazyKeys|{has?:string}>

	local function add(keymap)
		local keys = Keys.parse(keymap)
		if keys[2] == false then
			keymaps[keys.id] = nil
		else
			keymaps[keys.id] = keys
		end
	end
	for _, keymap in ipairs(M.get()) do
		add(keymap)
	end

	local opts = require("util").opts("nvim-lspconfig")
	local clients = vim.lsp.get_active_clients({ bufnr = buffer })
	for _, client in ipairs(clients) do
		local maps = opts.servers[client.name] and opts.servers[client.name].keys or {}
		for _, keymap in ipairs(maps) do
			add(keymap)
		end
	end
	return keymaps
end

function M.on_attach(client, buffer)
	local Keys = require("lazy.core.handler.keys")
	local keymaps = M.resolve(buffer)

	for _, keys in pairs(keymaps) do
		if not keys.has or M.has(buffer, keys.has) then
			local opts = Keys.opts(keys)
			---@diagnostic disable-next-line: no-unknown
			opts.has = nil
			opts.silent = opts.silent ~= false
			opts.buffer = buffer
			vim.keymap.set(keys.mode or "n", keys[1], keys[2], opts)
		end
	end
end

function M.diagnostic_goto(next, severity)
	local go = next and vim.diagnostic.goto_next or vim.diagnostic.goto_prev
	severity = severity and vim.diagnostic.severity[severity] or nil
	return function()
		go({ severity = severity })
	end
end
return M
