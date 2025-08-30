-- Модуль перемещения строк вверх/вниз
local M = {}

-- Нормальный режим: переместить строку
M.normal = function()
  vim.keymap.set("n", "<Leader>k", ":m-2<CR>", { noremap = true, silent = true })
  vim.keymap.set("n", "<Leader>j", ":m+1<CR>", { noremap = true, silent = true })

  vim.keymap.set("n", "<A-Up>", ":m-2<CR>", { noremap = true, silent = true })
  vim.keymap.set("n", "<A-Down>", ":m+1<CR>", { noremap = true, silent = true })
end

-- Визуальный режим: переместить выделение
M.visual = function()
  vim.keymap.set("v", "<Leader>k", ":m '<-2<CR>gv=gv", { noremap = true, silent = true })
  vim.keymap.set("v", "<Leader>j", ":m '>+1<CR>gv=gv", { noremap = true, silent = true })

  vim.keymap.set("v", "<A-Up>", ":m '<-2<CR>gv=gv", { noremap = true, silent = true })
  vim.keymap.set("v", "<A-Down>", ":m '>+1<CR>gv=gv", { noremap = true, silent = true })
end

-- Insert режим: переместить строку и вернуться в insert
M.insert = function()
  vim.keymap.set("i", "<A-Up>", "<Esc>:m-2<CR>gi", { noremap = true, silent = true })
  vim.keymap.set("i", "<A-Down>", "<Esc>:m+1<CR>gi", { noremap = true, silent = true })
end

-- Инициализация
M.setup = function()
  M.normal()
  M.visual()
  M.insert()
end

return M
