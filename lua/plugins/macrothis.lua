return {
  "desdic/macrothis.nvim",
  opts = {},
  keys = {
    { "<Leader>kks", function() require("macrothis").save() end, desc = "Save macro" },
    { "<Leader>kkl", function() require("macrothis").load() end, desc = "Load macro" },
    { "<Leader>kke", function() require("macrothis").edit() end, desc = "Edit macro" },
    { "<Leader>kkr", function() require("macrothis").run() end, desc = "Run macro" },
  }
}
