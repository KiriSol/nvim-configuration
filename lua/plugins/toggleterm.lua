function _G._set_terminal_keymaps()
	local opts = { buffer = 0 }
	vim.keymap.set("t", "<Esc>", [[<C-\><C-n>]], opts)
	vim.keymap.set("t", "<C-h>", [[<Cmd>wincmd h<CR>]], opts)
	vim.keymap.set("t", "<C-j>", [[<Cmd>wincmd j<CR>]], opts)
	vim.keymap.set("t", "<C-k>", [[<Cmd>wincmd k<CR>]], opts)
	vim.keymap.set("t", "<C-l>", [[<Cmd>wincmd l<CR>]], opts)
	-- vim.keymap.set("t", "<C-w>", [[<C-\><C-n><C-w>]], opts)
end

-- if you only want these mappings for toggle term use term://*toggleterm#* instead
vim.cmd("autocmd! TermOpen term://* lua _set_terminal_keymaps()")

return {
	"akinsho/toggleterm.nvim",
	version = "*",
	event = { "VeryLazy" },
	cmd = {
		"ToggleTerm",
		"ToggleTermSetName",
		"ToggleTermToggleAll",
		"ToggleTermSendCurrentLine",
		"ToggleTermSendVisualLines",
		"ToggleTermSendVisualSelection",
		"TermExec",
		"TermSelect",
	},
	opts = {
		shading_factor = -20,
		open_mapping = [[<c-\>]],
		size = function(term)
			if term.direction == "horizontal" then
				return vim.o.lines * 0.3
			elseif term.direction == "vertical" then
				return vim.o.columns * 0.3
			end
		end,
		insert_mappings = true,
		terminal_mappings = true,
		float_opts = {
			border = "curved",
			title_pos = "center",
			height = function()
				return math.ceil(vim.o.lines * 0.85)
			end,
		},
		winbar = {
			enabled = true,
		},
	},
	keys = {
		{ [[<c-\>]] },
		{ "<leader>tv", "<cmd> ToggleTerm direction=vertical <cr>" },
		{ "<leader>tf", "<cmd> ToggleTerm direction=float <cr>" },
		{ "<leader>th", "<cmd> ToggleTerm direction=horizontal <cr>" },
		{
			"<leader>gg",
			function()
				require("toggleterm.terminal").Terminal:new({ cmd = "lazygit", hidden = true }):toggle(nil, "float")
			end,
		},
		{
			"<leader>trb",
			function()
				require("toggleterm.terminal").Terminal:new({ cmd = "btm", hidden = true }):toggle(nil, "float")
			end,
		},
	},
}
