vim.opt.number = true -- Номера строк
vim.opt.relativenumber = true -- Относительные номера строк
vim.opt.numberwidth = 4 -- Ширина номера строки

vim.opt.cursorline = true -- Выделене линии курсора

vim.opt.scrolloff = 5 -- Отступ от края экрана при прокрутке
vim.opt.showmode = false

vim.opt.wrap = false -- Перенос строк

vim.opt.expandtab = true -- Замена табуляции но пробелы
vim.opt.tabstop = 4 -- Количество пробелов для табуляции
vim.opt.shiftwidth = 4 -- Количество пробелов при автодобавлении отступов
vim.opt.softtabstop = 4 -- Количество пробелов при автотабуляции

vim.opt.smarttab = true -- Умное поведение табуляции
vim.opt.smartindent = true -- Умное выравнивание табуляции

vim.opt.ignorecase = true -- Игнорировать регистр при поиске
vim.opt.smartcase = true -- Игнорировать регистр, если нет заглавных букв

vim.opt.mouse = "a"
vim.opt.mousemoveevent = true

vim.opt.splitbelow = false
vim.opt.splitright = true

-- vim.opt.clipboard = "unnamedplus"

vim.g.netrw_banner = 0
vim.g.netrw_liststyle = 3

vim.diagnostic.config({
	signs = {
		text = {
			[vim.diagnostic.severity.ERROR] = "",
			[vim.diagnostic.severity.WARN] = "",
			[vim.diagnostic.severity.INFO] = "",
			[vim.diagnostic.severity.HINT] = "󰌵",
		},
	},
})
