return {
  "ArcaneSpecs/HexEditor.nvim",
  config = function()
    require("HexEditor").setup {
      dump_cmd = "xxd -g 1 -u",
      assemble_cmd = "xxd -r",
    }
  end,
}