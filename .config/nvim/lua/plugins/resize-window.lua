local M = {}

M.name = 'resize-window'

M.options = {
  -- Directory where the plugin is installed
  dir = vim.fn.stdpath('config') .. '/lua/plugins/',
  -- Filetypes to exclude when resizing
  exclude_filetypes = { 'NvimTree' },
  -- Auto toggle when entering buffer is enabled
  is_auto_enabled = true,
  -- Resize ratio
  resize_ratio = 0.62,
}

M.commands = {
  resize = 'ResizeWindowResize',
  restore = 'ResizeWindowRestore',
}

function M.resize()
  local win_height = math.floor(vim.o.lines * M.options.resize_ratio) - vim.o.cmdheight
  local win_width = math.floor(vim.o.columns * M.options.resize_ratio)
  vim.cmd("resize " .. win_height)
  vim.cmd("vertical resize " .. win_width)
  vim.cmd("set cmdheight=1")
end

function M.restore()
  vim.cmd("wincmd =")
end

function M.on_enter()
  if vim.tbl_contains(M.options.exclude_filetypes, vim.bo.filetype) then
    return
  end
  M.resize();
end

function M.on_leave()
  M.restore();
end

function M.config()
  vim.api.nvim_create_user_command(M.commands.resize, M.resize, {});
  vim.api.nvim_create_user_command(M.commands.restore, M.restore, {})

  if M.options.is_auto_enabled then
    vim.api.nvim_create_autocmd("BufEnter", { pattern = "*", callback = M.on_enter })
    vim.api.nvim_create_autocmd("BufLeave", { pattern = "*", callback = M.on_leave })
  end
end

return { name = M.name, dir = M.options.dir, config = M.config }
