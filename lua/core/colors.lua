-- Set options
vim.opt.termguicolors = true
vim.g.colors_name = vim.g.colors_name or "default"

SetBackground = {
	isTransparent = false,
	VimTheme = {
		---@param color string | nil
		SetColor = function(color)
			if color then
				vim.cmd.colorscheme(color)
			end
			if SetBackground.isTransparent then
				SetBackground.VimTheme.transparency.enable()
			end
			local change_bg = {
				"NormalFloat",
				"ColorColumn",
				"NeoTreeFloatTitle",
			}
			for _, v in pairs(change_bg) do
				vim.api.nvim_set_hl(0, v, { bg = "none" })
			end
		end,
		transparency = {
			enable = function()
				SetBackground.isTransparent = true
				vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
			end,
			disable = function()
				SetBackground.isTransparent = false
				vim.cmd.colorscheme(vim.g.colors_name)
				local background = vim.api.nvim_get_hl_by_name("Normal", true).background
				background = background or "#2E3440"
				vim.api.nvim_set_hl(0, "Normal", { bg = background })
				SetBackground.VimTheme.SetColor()
			end,
			toggle = function()
				if SetBackground.isTransparent then
					SetBackground.VimTheme.transparency.disable()
				else
					SetBackground.VimTheme.transparency.enable()
				end
				print("Toggle transparency")
			end,
		},
	},
	CustomChangeFunc = {
		default = {
			enable = function()
				SetBackground.VimTheme.transparency.enable()
			end,
			disable = function()
				SetBackground.VimTheme.transparency.disable()
			end,
			toggle = function()
				SetBackground.VimTheme.transparency.toggle()
			end,
		},
	},
	OtherTheme = {
		---@param color string | nil
		SetColor = function(color)
			if color then
				vim.cmd.colorscheme(color)
			end
			if SetBackground.isTransparent then
				SetBackground.OtherTheme.transparency.enable()
			else
				SetBackground.OtherTheme.transparency.disable()
			end
		end,
		transparency = {
			enable = function()
				SetBackground.isTransparent = true
				local theme = SetBackground.CustomChangeFunc[vim.g.colors_name]
					or SetBackground.CustomChangeFunc.default
				theme.enable()
			end,
			disable = function()
				SetBackground.isTransparent = false
				local theme = SetBackground.CustomChangeFunc[vim.g.colors_name]
					or SetBackground.CustomChangeFunc.default
				theme.disable()
			end,
			toggle = function()
				if SetBackground.isTransparent then
					SetBackground.OtherTheme.transparency.disable()
				else
					SetBackground.OtherTheme.transparency.enable()
				end
				print("Toggle transparency")
			end,
		},
	},
}

SetColor = SetBackground.OtherTheme.SetColor

SwitchTheme = {
	current_theme_index = 1,
	list_to_switch = { "habamax" },
	switch = function()
		SwitchTheme.current_theme_index = SwitchTheme.current_theme_index + 1
		if not SwitchTheme.list_to_switch[SwitchTheme.current_theme_index] then
			SwitchTheme.current_theme_index = 1
		end
		SetBackground.OtherTheme.SetColor(SwitchTheme.list_to_switch[SwitchTheme.current_theme_index])
		print("set colorscheme " .. SwitchTheme.list_to_switch[SwitchTheme.current_theme_index])
	end,
}
