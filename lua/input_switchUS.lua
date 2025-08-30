local M = {}

-- Кот английской раскладки (US)
local layout_normal = "1033"

-- Переключение раскладки
local function switch_to_english()
  vim.fn.system("im-select.exe " .. layout_normal)
end

-- Только переключение при выходе из Insert
function M.setup()
  vim.api.nvim_create_autocmd("InsertLeave", {
    callback = switch_to_english,
  })
end

return M
