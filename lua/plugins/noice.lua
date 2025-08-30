return {
  "folke/noice.nvim",
  enabled = true,
  event = "VeryLazy",
  dependencies = {
    "MunifTanjim/nui.nvim",
    "rcarriga/nvim-notify",
    "hrsh7th/nvim-cmp",
    "hrsh7th/cmp-cmdline",
  },
  config = function()
    require("noice").setup({
   
    
    lsp = {
       enabled = true,
       signature = { enabled = true },
       hover = { enabred = true },
    -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
       override = {
         ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
         ["vim.lsp.util.stylize_markdown"] = true,
         ["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
        },
       },
  -- you can enable a preset for easier configuration
    presets = {
    --   bottom_search = true, -- use a classic bottom cmdline for search
    --   command_palette = true, -- position the cmdline and popupmenu together
    --   long_message_to_split = true, -- long messages will be sent to a split
    --   inc_rename = false, -- enables an input dialog for inc-rename.nvim
    --   lsp_doc_border = false, -- add a border to hover docs and signature help
       },

    cmdline = {
        enabled = true ,
        view = "cmdline", -- "cmdline" | "cmdline_popup"
        opts = {
          -- position = { row = "100%", col = "50%" }, -- position of the popup
          -- size = { width = "100%", height = "auto" }, -- size of the popup
          -- border = { style = "rounded", padding = { 0, 1 } }, -- border of the popup
          win_options = { 
        --    winhighlight = { Normal = "Normal", FloatBorder = "DiagnosticInfo" }, 
          },
        },
        format = {
          cmdline = { pattern = "^:", icon = "", lang = "vim" },
          substitute = { pattern = "^:s", icon = "", lang = "vim" },
          search_down = { kind = "search", pattern = "^/", icon = " ", lang = "regex" },
          search_up = { kind = "search", pattern = "^%?", icon = " ", lang = "regex" },
          filter = { pattern = "^:%s*!", icon = "$", lang = "bash" },
          lua = { pattern = { "^:%s*lua%s+", "^:%s*lua%s*=%s*", "^:%s*=%s*" }, icon = "", lang = "lua" },
          help = { pattern = "^:%s*he?l?p?%s+", icon = "" },
          input = { view = "cmdline_input", icon = "󰥻 " }, -- Used by input()
          -- lua = false, -- to disable a format, set to `false`
        },
      },
      messages = {
        enabled = true,
        view = "mini", -- "mini" | "notify" | "split"
	view_error = "notify", -- view for errors
    	view_warn = "notify", -- view for warnings
    	view_history = "notify", -- view for :messages
    	view_search = "virtualtext", -- view for search count messages. Set to `false` to disable
        },
      routes = {
      {
     	 filter = { event = "msg_showcmd" },
    	 view = "mini",
   	 },
 	 },
      }) 
    require("notify").setup({ 
      stages = "fade", 
      timeout = 5000, 
      render = "default", 
    })

--    vim.notify = require("notify") -- redirect vim.notify to use nvim-notify
  end,
}
