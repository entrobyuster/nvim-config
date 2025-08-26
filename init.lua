require("config.lazy")
require("config.keymaps")
require("config.keymaps")
require("config.options")
require("input_switch").setup()

local input_switch = require("input_switch")

require("lualine").setup({
  options = {
    theme = "auto",
    section_separators = "",
    component_separators = "",
  },
  sections = {
    lualine_a = { "mode" },
    lualine_b = { "branch" },
    lualine_c = {
      { input_switch.get_current_layout, icon = "" },
    },
    lualine_x = { "encoding", "fileformat", "filetype" },
    lualine_y = { "progress" },
    lualine_z = { "location" },
  },
})


vim.g.mapleader = " "
vim.g.localleader = ","

-- 🎨 Neovide GUI
if vim.g.neovide then
  vim.g.neovide_cursor_vfx_mode = "railgun"
  vim.g.neovide_transparency = 0.9
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

-- 🚀 Маппинги
-- vim.keymap.set("n", "<Leader>q", ":q<CR>")
-- vim.keymap.set("n", "<Leader>w", ":w<CR>")
-- vim.keymap.set("n", "<Leader>h", ":split<CR>")
-- vim.keymap.set("n", "<Leader>v", ":vsplit<CR>")
