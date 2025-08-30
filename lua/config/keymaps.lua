local map = require("langmapper").map

-- нормальные команды
map("n", "вв", "dd") -- русское dd
map("n", "яя", "yy")
map("n", "гг", "gg")
map("n", "жж", "zz")
-- map("n", "г", "u")       -- русская г → undo
-- map("n", "Г", "U")       -- русская Г → redo


-- поиск и командная строка
map("n", ".", "/")   -- русская точка → поиск
map("n", ":", ":")   -- русское Shift+ж → командная строка

-- Ctrl бинды
map("n", "<C-г>", "<C-u>") -- Ctrl+г = Ctrl+u
map("n", "<C-к>", "<C-d>") -- Ctrl+к = Ctrl+d

-- Копировать в системный буфер
vim.keymap.set({ "n", "v" }, "<C-S-c>", '"+y', { desc = "Copy to system clipboard" })

-- Вставить из системного буфера
vim.keymap.set("n", "<C-S-v>", '"+p', { desc = "Paste from system clipboard" })
vim.keymap.set("i", "<C-S-v>", '<Esc>"+pa', { desc = "Paste in insert mode" })

-- Функциональные клавиши
map("n", "<F2>", ":")           -- вход в командную строку
map("n", "<F3>", ":w<CR>")      -- сохранить
map("n", "<F4>", ":q<CR>")      -- выйти
vim.keymap.set("n", "<S-F4>", ":q!<CR>", { desc = "Выход без сохранения" })
map("n", "<F5>", function()     -- вручную переключить раскладку
    vim.fn.system("im-select.exe 1033")
end)

map("n", "<F6>", ":e ~/decompress.md<CR>") -- открыть протокол

-- Быстрый выход из Insert
map("i", "jj", "<Esc>")


-- Перемещение между окнами
-- map("n", "<C-h>", "<C-w>h")
-- map("n", "<C-j>", "<C-w>j")
-- map("n", "<C-k>", "<C-w>k")
-- map("n", "<C-l>", "<C-w>l")
