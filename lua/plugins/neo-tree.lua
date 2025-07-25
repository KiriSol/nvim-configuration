return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
		"MunifTanjim/nui.nvim",
	},
	cmd = "Neotree",
	---@module "neo-tree"
	---@type neotree.Config?
	opts = {
		close_if_last_window = true, -- Close Neo-tree if it is the last window left in the tab
		popup_border_style = "rounded",
		enable_git_status = true,
		enable_diagnostics = true,

		sources = {
			"document_symbols",
			"filesystem",
			"buffers",
			"git_status",
		},
		-- source_selector = {
		-- 	winbar = true,
		-- 	statusline = true,
		-- },

		default_component_configs = {
			indent = {
				-- indent_size = 2,
				-- padding = 1,
				-- indent_marker = "│",
				last_indent_marker = "╰",
				with_expanders = nil, -- if nil and file nesting is enabled, will enable expanders
			},
		},
		window = {
			width = 40,
			mappings = {
				["P"] = { "toggle_preview", config = { use_float = true } },
			},
		},
		document_symbols = {
			window = {
				position = "right",
				width = 35,
				mapping_options = {
					noremap = true,
					nowait = true,
				},
			},
		},
		filesystem = {
			window = {
				position = "left",
				width = 35,
				mapping_options = {
					noremap = true,
					nowait = true,
				},
			},
			filtered_items = {
				never_show_by_pattern = IGNONE_FILETYPES_BY_PATTERN,
			},
		},
	},
	keys = {
		{
			"<leader>ee",
			"<cmd> Neotree filesystem left <cr>",
			desc = "NeoTree filesystem left focus",
			{ noremap = true },
		},
		{
			"<leader>E",
			"<cmd> Neotree filesystem reveal left <cr>",
			desc = "NeoTree filesystem left reveal focus",
			{ noremap = true },
		},
		{
			"<leader>et",
			"<cmd> Neotree filesystem reveal toggle left <cr>",
			desc = "NeoTree filesystem left toggle",
			{ noremap = true },
		},
		{
			"<leader>ef",
			"<cmd> Neotree filesystem reveal float <cr>",
			desc = "NeoTree filesystem float",
			{ noremap = true },
		},
		{ "<leader>eb", "<cmd> Neotree buffers float <cr>", desc = "NeoTree buffers", { noremap = true } },
		{ "<leader>gS", "<cmd> Neotree git_status float <cr>", desc = "NeoTree git_status", { noremap = true } },
		-- {
		-- 	"<localleader>et",
		-- 	"<cmd> Neotree filesystem position=current toggle <cr>",
		-- 	desc = "NeoTree",
		-- 	{ noremap = true },
		-- },
		{
			"gO",
			"<cmd> Neotree document_symbols toggle right <cr>",
			desc = "NeoTree document symbols",
			{ noremap = true },
		},
	},
}
