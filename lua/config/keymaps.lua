-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

vim.api.nvim_set_keymap(
	"n",
	"<localleader>bg",
	"<cmd> lua SetBackground.OtherTheme.transparency.toggle() <cr>",
	{ noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
	"n",
	"<localleader>st",
	"<cmd> lua SwitchTheme.switch() <cr>",
	{ noremap = true, silent = true }
)

vim.api.nvim_set_keymap("n", "<localleader>w", "<cmd> wa <cr>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>:", ":lua ", { noremap = true })

vim.api.nvim_set_keymap("v", "<localleader>y", '"+y', { noremap = true })
vim.api.nvim_set_keymap("n", "<localleader>y", '"+y', { noremap = true })
vim.api.nvim_set_keymap("n", "<localleader>yy", '"+yy', { noremap = true })
vim.api.nvim_set_keymap("n", "<localleader>p", '"+p', { noremap = true })
vim.api.nvim_set_keymap("n", "<localleader>P", '"+P', { noremap = true })

vim.keymap.set("n", "<localleader>lz", "<cmd> Lazy <cr>")
