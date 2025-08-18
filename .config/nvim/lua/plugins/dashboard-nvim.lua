return {
  "nvimdev/dashboard-nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  event = "VimEnter",
  keys = {
    { "<LEADER>db", "<CMD>Dashboard<CR>", desc = "Open Dashboard" }, },
  config = function()
    -- Setup the dashboard-nvim plugin
    require("dashboard").setup {
      config = {
        week_header = { enable = false },
        packages = { enable = false },
        header = {
          "███╗   ██╗██╗   ██╗██╗███╗   ███╗",
          "████╗  ██║██║   ██║██║████╗ ████║",
          "██╔██╗ ██║██║   ██║██║██╔████╔██║",
          "██║╚██╗██║╚██╗ ██╔╝██║██║╚██╔╝██║",
          "██║ ╚████║ ╚████╔╝ ██║██║ ╚═╝ ██║",
          "╚═╝  ╚═══╝  ╚═══╝  ╚═╝╚═╝     ╚═╝",
          "",
        },
        shortcut = {
          {
            desc = "FZF",
            group = "DashboardShortCut",
            action = function()
              vim.cmd("Files");
            end,
            key = "f",
          },
          {
            desc = "Ripgrep",
            group = "DashboardShortCut",
            action = function()
              vim.cmd("RG");
            end,
            key = "r",
          },
          {
            desc = "Buffers",
            group = "DashboardShortCut",
            action = function()
              vim.cmd("Buffers");
            end,
            key = "b",
          },
          {
            desc = "Git",
            group = "DashboardShortCut",
            action = function()
              vim.cmd("GF?");
            end,
            key = "g",
          },
          {
            desc = "History",
            group = "DashboardShortCut",
            action = function()
              vim.cmd("History");
            end,
            key = "h",
          },
        },
        project = {
          limit = 8,
          action = function(path)
            vim.cmd('cd ' .. path)
            print('Changed directory to: ' .. path)
          end
        },
        footer = {
          "",
        },
      }
    }
    -- Configure colors
    vim.api.nvim_set_hl(0, "DashboardHeader", { fg = "#c7a9ff", bold = true })
    vim.api.nvim_set_hl(0, "DashboardFooter", { fg = "#c7a9ff", italic = true })
    vim.api.nvim_set_hl(0, "DashboardMruIcon", { fg = "#ff899d" })
    vim.api.nvim_set_hl(0, "DashboardMruTitle", { fg = "#a4daff" })
    vim.api.nvim_set_hl(0, "DashboardMruTitleIcon", { fg = "#a4daff" })
    vim.api.nvim_set_hl(0, "DashboardProjectIcon", { fg = "#9fe044" })
    vim.api.nvim_set_hl(0, "DashboardProjectTitle", { fg = "#a4daff" })
    vim.api.nvim_set_hl(0, "DashboardProjectTitleIcon", { fg = "#c7a9ff" })
    vim.api.nvim_set_hl(0, "DashboardFiles", { fg = "#8db0ff" })
    vim.api.nvim_set_hl(0, "DashboardShortCut", { fg = "#faba4a" })
  end,
}
