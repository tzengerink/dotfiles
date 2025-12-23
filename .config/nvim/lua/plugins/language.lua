return {
  {
    'neovim/nvim-lspconfig',
    dependencies = {
      'hrsh7th/nvim-cmp',         -- Autocompletion plugin
      'hrsh7th/cmp-nvim-lsp',     -- LSP source for nvim-cmp
      'hrsh7th/cmp-buffer',       -- Buffer source
      'hrsh7th/cmp-path',         -- Path source
      'hrsh7th/cmp-cmdline',      -- Command line source
    },
    config = function()
      local cmp = require('cmp')

      cmp.setup({
        mapping = cmp.mapping.preset.insert({
          ['<C-j>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
          ['<C-k>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
          ['<Tab>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
          ['<CR>'] = cmp.mapping.confirm({ select = true }),
        }),
        sources = cmp.config.sources({
          { name = 'nvim_lsp' },
        }, {
          { name = 'buffer' },
          { name = 'path' },
        })
      })

      -- Set up LSP servers
      local capabilities = require('cmp_nvim_lsp').default_capabilities()

      -- TypeScript/JavaScript
      -- Install with: sudo npm install -g typescript-language-server typescript
      vim.lsp.config('ts_ls', {
        capabilities = capabilities,
        cmd = { "typescript-language-server", "--stdio" },
        filetypes = {
          'javascript',
          'javascriptreact',
          'javascript.jsx',
          'typescript',
          'typescriptreact',
          'typescript.tsx',
        },
        on_attach = function(client, bufnr)
          local opts = { noremap=true, silent=true, buffer=bufnr }
          vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
          vim.keymap.set('n', 'grn', vim.lsp.buf.rename, opts)
          vim.keymap.set('n', 'gra', vim.lsp.buf.code_action, opts)
          vim.keymap.set('n', 'grr', vim.lsp.buf.references, opts)
          vim.keymap.set('n', 'gri', vim.lsp.buf.implementation, opts)
        end,
      })

      -- Python (Pyright)
      -- Install with: sudo npm install -g pyright
      vim.lsp.config('pyright', {
        capabilities = capabilities,
        cmd = { "pyright-langserver", "--stdio" },
        on_attach = function(client, bufnr)
          client.server_capabilities.inlayHintProvider = false

          local opts = { noremap=true, silent=true, buffer=bufnr }
          vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
          vim.keymap.set('n', 'grn', vim.lsp.buf.rename, opts)
          vim.keymap.set('n', 'gra', vim.lsp.buf.code_action, opts)
          vim.keymap.set('n', 'grr', vim.lsp.buf.references, opts)
          vim.keymap.set('n', 'gri', vim.lsp.buf.implementation, opts)
        end,
        settings = {
          pyright = {
            disableLanguageServices = false,
            disableOrganizeImports = false,
          },
          python = {
            analysis = {
              typeCheckingMode = "basic",
              autoSearchPaths = true,
              useLibraryCodeForTypes = true,
              diagnosticMode = "workspace",
              venvPath = vim.fn.getcwd(),
              pythonPath = vim.fn.getcwd() .. '/.venv/bin/python',
            }
          }
        },
      })

      -- Diagnostic configuration
      vim.diagnostic.config({
        virtual_text = true,
        signs = true,
        underline = true,
        update_in_insert = false,
        severity_sort = true,
      })

      vim.lsp.enable('ts_ls')
      vim.lsp.enable('pyright')
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      local config = require('nvim-treesitter.configs')
      config.setup({
        ensure_installed = {
          "typescript",
          "tsx",
          "javascript",
          "html",
          "markdown",
          "json",
          "bash",
          "gitignore",
          "dockerfile",
          "python",
        },
        sync_install = false,
        highlight = { enable = true },
        indent = { enable = true },
      })
    end,
  },
  {
    'stevearc/conform.nvim',
    opts = {
      formatters_by_ft = {
        javascript = { "prettier" },
        typescript = { "prettier" },
        python = { "isort", "black" },
      },
      format_on_save = {
        timeout_ms = 500,
        lsp_format = "fallback",
      },
    },
  },
  {
    'prettier/vim-prettier',
    enabled = false,
    config = function()
      vim.cmd([[
        let g:prettier#config#trailing_comma = 'all'
        let g:prettier#exec_cmd_async = 1
        let g:prettier#autoformat = 1
        let g:prettier#autoformat_require_pragma = 0
      ]])
    end
  },
}
