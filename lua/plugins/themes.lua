Themes = {
	{
		"navarasu/onedark.nvim",
		lazy = true,
		opts = {
			style = "dark", -- dark, darker, cool, deep, warm, warmer, light
			transparent = true,
			code_style = {
				comments = "italic",
				keywords = "italic",
				functions = "none",
			},
			colors = {
				bg0 = "#313746",
				bg1 = "#3b4252",
				bg_d = "#2e3440", -- Neo-tree split
			},
		},
		init = function()
			local one = require("onedark")
			SetBackground.CustomChangeFunc["onedark"] = {
				enable = function()
					Themes[1].opts.transparent = true
					one.setup(Themes[1].opts)
					vim.cmd.colorscheme("onedark")
					vim.api.nvim_set_hl(0, "FloatBorder", { bg = "none" })
					vim.api.nvim_set_hl(0, "NeoTreeFloatTitle", { bg = "none" })
					vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
				end,
				disable = function()
					Themes[1].opts.transparent = false
					one.setup(Themes[1].opts)
					vim.cmd.colorscheme("onedark")
				end,
			}
		end,
	},
	{
		"folke/tokyonight.nvim",
		lazy = true,
		opts = {
			style = "storm",
			transparent = false,
		},
		init = function()
			local tokyo = require("tokyonight")
			for _, v in pairs({
				"tokyonight-storm",
				"tokyonight-night",
				"tokyonight-moon",
				"tokyonight-day",
			}) do
				SetBackground.CustomChangeFunc[v] = {
					enable = function()
						Themes[2].opts.transparent = true
						tokyo.setup(Themes[2].opts)
						vim.cmd.colorscheme(v)
						-- TODO: сделать переопределение фона
						vim.api.nvim_set_hl(0, "NeoTreeNormal", { bg = "none" })
					end,
					disable = function()
						Themes[2].opts.transparent = false
						tokyo.setup(Themes[2].opts)
						vim.cmd.colorscheme(v)
					end,
				}
			end
		end,
	},
	{
		"catppuccin/nvim",
		name = "catppuccin",
		lazy = false,
		priority = 1000,
		opts = {
			flavour = "auto", -- latte, frappe, macchiato, mocha
			background = {
				light = "latte",
				dark = "frappe",
			},
			transparent_background = false,
		},
		init = function()
			local cat = require("catppuccin")
			for _, v in pairs({
				"catppuccin-frappe",
				"catppuccin-macchiato",
				"catppuccin-mocha",
				"catppuccin-latte",
			}) do
				SetBackground.CustomChangeFunc[v] = {
					enable = function()
						cat.options.transparent_background = true
						cat.compile()
						vim.cmd.colorscheme("catppuccin")
					end,
					disable = function()
						cat.options.transparent_background = false
						cat.compile()
						vim.cmd.colorscheme("catppuccin")
					end,
				}
			end
		end,
	},
}

return Themes
