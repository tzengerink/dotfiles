return {
  {
    'nvim-tree/nvim-tree.lua',
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    opts = {
      on_attach = on_nvim_tree_attach,
      git = { ignore = false },
      view = { width = 40 },
      renderer = { highlight_git = true },
      filters = { dotfiles = true, git_ignored = true },
      actions = {
        change_dir = {
          enable = true,
          global = true,
        },
      },
      sync_root_with_cwd = true,
      respect_buf_cwd = true,
      update_focused_file = {
        enable = true,
        update_cwd = true,
      },
    },
    keys = {
      { '<C-n>', function() require("nvim-tree.api").tree.toggle({ find_file = true, focus = true }) end, { noremap = true, silent = true } },
    }
  },
  {
    "kevinhwang91/nvim-bqf",
    ft = "qf",
    keys = {
      { "<LEADER>q", ":copen<CR>", { noremap = true, silent = true } },
      { "<LEADER>Q", ":cclose<CR>", { noremap = true, silent = true } },
    },
  },
  {
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
  },
  {
    'akinsho/bufferline.nvim',
    version = "*",
    dependencies = 'nvim-tree/nvim-web-devicons',
    config = function()
      require('bufferline').setup({
        options = {
          mode = 'tabs',
          always_show_bufferline = false,
        },
      })
    end,
  },
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require('lualine').setup({
        sections = {
          lualine_a = { 'mode' },
          lualine_b = { 'branch', 'diff', 'diagnostics' },
          lualine_c = {
            { 'filename', path = 3 },
          },
          lualine_x = {},
          lualine_y = { 'progress' },
          lualine_z = { 'location' }
        },
      })
    end
  },
}
