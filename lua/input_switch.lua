local M = {}

-- Кот английской раскладки (US)
local layout_normal = "1033"

-- Переключение раскладки
local function switch_to_english()
  vim.fn.system("im-select.exe " .. layout_normal)
end

-- Получуние тюкущей расклащки
function M.get_current_layout()
  local code = vim.fn.system("im-select.exe"):gsub("%s+", "")
  if code == "1033" then
    return "EN"
  elseif code == "1049" then
    return "RU"
  else
    return "??"
  end
end

-- Только переключение при выходе из Insert
function M.setup()
  vim.api.nvim_create_autocmd("InsertLeave", {
    callback = switch_to_english,
  })
end

return M
