return {
	"williamboman/mason.nvim",
	event = "VeryLazy",
	build = ":MasonUpdate",
	opts = {
		ui = {
			border = "rounded",
		},
	},
}
