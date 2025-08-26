-- bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git", "clone", "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- setup plugins
require("lazy").setup({
  {
    "Wansmer/langmapper.nvim",
    lazy = false,
    priority = 1,
    config = function()
      require("langmapper").setup({
        hack_keymap = true,
        map_all_ctrl = true,
        ctrl_map_modes = { "n", "o", "i", "c", "t", "v" },
      })
      require("langmapper").automapping({
        global = true,
        buffer = true,
      })
    end,
  },
  {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    require("lualine").setup({})
  end,
},
})
