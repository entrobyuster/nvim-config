return {
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
}
