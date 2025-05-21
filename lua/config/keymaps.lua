-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

vim.keymap.set(
	"n",
	"<localleader>bg",
	"<cmd> lua SetBackground.OtherTheme.transparency.toggle() <cr>",
	{ noremap = true, silent = true }
)
vim.keymap.set("n", "<localleader>st", "<cmd> lua SwitchTheme.switch() <cr>", { noremap = true, silent = true })

vim.keymap.set("n", "<leader>bw", "<cmd> wa <cr>", { noremap = true })
vim.keymap.set("n", "<leader>:", ":lua ", { noremap = true })

vim.keymap.set("v", "<localleader>y", '"+y', { noremap = true })
vim.keymap.set("n", "<localleader>y", '"+y', { noremap = true })
vim.keymap.set("n", "<localleader>yy", '"+yy', { noremap = true })
vim.keymap.set("n", "<localleader>p", '"+p', { noremap = true })
vim.keymap.set("n", "<localleader>P", '"+P', { noremap = true })

vim.keymap.set("n", "<localleader>lz", "<cmd> Lazy <cr>")
