local M = {}

---@type PluginLspKeys
M._keys = nil

---@return (LazyKeys|{has?:string})[]
function M.get()
	local format = function()
		require("plugins.LSP.format").format({ force = true })
	end
	if not M._keys then
  ---@class PluginLspKeys
    -- stylua: ignore
    M._keys =  {
      { "]d", M.diagnostic_goto(true), desc = "下一个诊断" },
      { "[d", M.diagnostic_goto(false), desc = "上一个诊断" },
      { "]e", M.diagnostic_goto(true, "ERROR"), desc = "下一个错误" },
      { "[e", M.diagnostic_goto(false, "ERROR"), desc = "上一个错误" },
      { "]w", M.diagnostic_goto(true, "WARN"), desc = "下一个警告" },
      { "[w", M.diagnostic_goto(false, "WARN"), desc = "上一个警告" },
      { "<leader>ck", '<cmd>Lspsaga hover_doc<cr>', desc = "查看信息" },
      { "<leader>cf", format, desc = "格式化文件", has = "formatting" },
      { "<leader>cf", format, desc = "区域格式化", mode = "v", has = "rangeFormatting" },
      { "<leader>cr", "<cmd>Lspsaga rename ++project<cr>", desc = "重命名", has = "rename" },
      { "<leader>ca", "<cmd>Lspsaga code_action<cr>", desc = "Code Action", mode = { "n", "v" }, has = "codeAction" },
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
