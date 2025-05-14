return {
	"mfussenegger/nvim-lint",
	event = "VeryLazy",
	config = function()
		local lint = require("lint")
		lint.linters_by_ft = {
			python = { "ruff" },
		}

		local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })
		vim.api.nvim_create_autocmd({ "BufReadPost", "BufWritePost", "InsertLeave" }, {
			group = lint_augroup,
			callback = function()
				lint.try_lint()
				-- lint.try_lint("cspell")
			end,
		})
	end,
	keys = {
		{
			"<leader>ln",
			function()
				local lint = require("lint")
				lint.try_lint()
				-- lint.try_lint("cspell")
			end,
			desc = "Trigger linting for current buffer",
		},
		{
			"<leader>ls",
			function()
				local lint = require("lint")
				lint.try_lint("cspell")
			end,
			desc = "Trigger cspell lint for current buffer",
		},
	},
}
