return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local input_switch = require("input_switch")
    input_switch.setup()

    require("lualine").setup({
      options = {
        theme = "auto",
        component_separators = { left = '', right = '' },
        section_separators = { left = '', right = '' },
      },
      sections = {
        lualine_a = { "mode" },
        lualine_b = {
		{ "branch" },
          	{ function() local f = vim.fn.expand("%:t"); return f ~= "" and f .. (vim.bo.modified and " [+]" or "") or "" end, color = { fg = "#c0cffb" } },
		},
        lualine_c = {
      	{
        	require("noice").api.status.command.get,
        	cond = require("noice").api.status.command.has,
        	color = { fg = "#846511" },
      	},
      	{
        	require("noice").api.status.search.get,
        	cond = require("noice").api.status.search.has,
        	color = { fg = "#ff9e64" },
      	},
	{
        	require("noice").api.status.message.get_hl,
        	cond = require("noice").api.status.message.has,
     	},
	},
      	lualine_x = {
          { "encoding" }, 
	  { "fileformat" }, 
	  { "filetype" },

        },
        lualine_y = { "progress" },
        lualine_z = {
		{"location" },
          {
            function()
              return require("input_switch").current_layout
            end,
          },
      },
   }})
  end,
}
