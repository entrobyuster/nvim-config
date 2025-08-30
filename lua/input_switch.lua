local M = {}

M.current_layout = "??"
M.mode = "disabled" -- "native", "fallback", "disabled"

-- Коды раскладок
local layout_normal = "1033"

-- Переключение на английскую раскладку
local function switch_to_english()
  vim.fn.system("im-select.exe " .. layout_normal)
end

-- Проверка ОС
local function is_windows()
  return vim.loop.os_uname().version:match("Windows")
end

-- Решение: использовать сенсор или нет
local function should_use_layout_sensor()
  return is_windows()
end


-- Получение текущей раскладки
function M.get_current_layout()
  if not is_windows() then
    M.mode = "disabled"
    return "??"
  end


  local code = vim.fn.system("im-select.exe"):gsub("%s+", "")
  if code == "1033" then
    M.mode = "native"
    return "EN"
  elseif code == "1049" then
    M.mode = "native"
    return "RU"
  else
    M.mode = "fallback"
    return "??"
  end
end


function M.refresh_layout()
  M.current_layout = M.get_current_layout()
end

function M.setup()
  vim.api.nvim_create_autocmd("InsertLeave", {
    callback = switch_to_english,
  })

  if should_use_layout_sensor() then
    vim.api.nvim_create_autocmd({ "InsertEnter", "InsertLeave", "FocusGained", "WinEnter" }, {
      callback = function()
        M.refresh_layout()
      end,
    })
    M.refresh_layout()
  else
    M.current_layout = "??"
  end
end

vim.keymap.set("n", "<F12>", function()
  vim.fn.system("im-select.exe imkey")
  require("input_switch").refresh_layout()
  vim.notify("Phase toggled: " .. require("input_switch").current_layout)
end)

return M