return {
  "zaldih/themery.nvim",
  lazy = false,
  config = function()
    require("themery").setup({
      themes = { 
	      "default",
	      "blue",
        "darkblue",
        "delek",
        "desert",
        "elflord",
        "evening",
        "industry",
        "koehler",
        "morning",
        "murphy",
        "pablo",
        "peachpuff",
        "ron",
        "shine",
        "slate",
        "torte",
        "zellner",
        "catppuccin",
        "catppuccin-mocha",
        "catppuccin-frappe",
        "catppuccin-macchiato",
        "catppuccin-latte",
      }, -- твои темы
      livePreview = true,
    })
  end,
}
