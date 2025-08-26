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

-- Leader команды
map("n", "<Leader>q", ":q<CR>")
map("n", "<Leader>w", ":w<CR>")
map("n", "<Leader>h", ":split<CR>")
map("n", "<Leader>v", ":vsplit<CR>")