return {
	"lewis6991/gitsigns.nvim",
	event = "BufReadPost",
	opts = {},
	keys = {
		{
			"[c",
			function()
				require("gitsigns").nav_hunk("prev")
			end,
		},
		{
			"]c",
			function()
				require("gitsigns").nav_hunk("next")
			end,
		},
		-- TODO: настроить клавиши
	},
}
