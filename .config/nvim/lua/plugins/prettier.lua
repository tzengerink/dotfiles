return {
  {
    'prettier/vim-prettier',
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
