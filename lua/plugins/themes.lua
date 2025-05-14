Themes = {
	{
		"navarasu/onedark.nvim",
		event = { "ColorSchemePre" },
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
					vim.api.nvim_set_hl(0, "TabLineFill", { bg = "none" })
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
		event = { "ColorSchemePre" },
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
						Themes[2].opts.styles = {
							sidebars = "transparent",
							floats = "transparent",
						}
						tokyo.setup(Themes[2].opts)
						vim.cmd.colorscheme(v)
						vim.api.nvim_set_hl(0, "TabLineFill", { bg = "none" })
					end,
					disable = function()
						Themes[2].opts.transparent = false
						Themes[2].opts.styles = nil
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
	{
		"ellisonleao/gruvbox.nvim",
		priority = 1000,
		opts = {
			italic = {
				strings = false,
				emphasis = true,
				comments = true,
				operators = false,
				folds = true,
			},
			inverse = true, -- invert background for search, diffs, statuslines and errors
			contrast = "soft", -- can be "hard", "soft" or empty string
			transparent_mode = true,
		},
		init = function()
			SetBackground.CustomChangeFunc.gruvbox = {
				enable = function()
					Themes[4].opts.transparent_mode = true
					require("gruvbox").setup(Themes[4].opts)
					vim.cmd.colorscheme("gruvbox")
					vim.api.nvim_set_hl(0, "TabLineFill", { bg = "none" })
				end,
				disable = function()
					Themes[4].opts.transparent_mode = false
					require("gruvbox").setup(Themes[4].opts)
					vim.cmd.colorscheme("gruvbox")
				end,
			}
		end,
	},
}

return Themes
