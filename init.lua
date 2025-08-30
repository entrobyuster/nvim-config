require("config.lazy")
require("config.keymaps")
require("config.options")
require("config.move_lines").setup()
-- require("oil").setup()
-- require("input_switchUS").setup()


vim.o.guifont = "FiraCode Nerd Font:h14"

-- Автооткрытие HexEditor для бинарных файлов
vim.api.nvim_create_autocmd({ "BufReadPost" }, {
    pattern = { "*.bin", "*.dat", "*.exe", "*.o", "*.so" },
    callback = function()
        require("HexEditor").dump()
    end,
})
-- Маппинг для переключения в HexEditor и обратно
vim.keymap.set("n", "<leader>hx", function()
    require("HexEditor").toggle()
end, { desc = "Toggle hex view" })

vim.o.cmdheight = 1

--vim.g.mapleader = " "
--vim.g.localleader = ","

-- 🎨 Neovide GUI
if vim.g.neovide then
    vim.g.neovide_cursor_vfx_mode = "railgun"
    vim.g.neovide_opacity = 0.9
    vim.g.neovide_refresh_rate = 60
    vim.g.neovide_confirm_quit = true
end

-- ⚙️ Общие настройки
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.mouse = "a"
vim.opt.clipboard = "unnamedplus"
vim.opt.termguicolors = true
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 8

vim.opt.tabstop = 4        -- Визуальная ширина табуляции
vim.opt.shiftwidth = 4     -- Шаг отступа при >>, <<, autoindent
vim.opt.expandtab = true   -- Вставлять пробелы вместо табуляции
vim.opt.smarttab = true    -- Умное поведение Tab в начале строки
vim.opt.autoindent = true  -- Повторять отступ предыдущей строки
vim.opt.copyindent = true  -- Копировать структуру отступа
